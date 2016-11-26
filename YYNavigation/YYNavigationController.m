//
//  YYNavigationController.m
//  YYNavigationBarExample
//
//  Created by yangyang on 2016/11/11.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "YYNavigationController.h"
#import "YYNavigationBar.h"
#import "UIViewController+YYNavigationView.h"
#import "YYNavigationPopAnimation.h"

typedef NS_ENUM(NSUInteger, YYNavigationBackType) {
    
    kYYNavigationBackTypeButton = 0,
    kYYNavigationBackTypeGesture
};

@interface YYNavigationController () <UINavigationControllerDelegate>

@property (nonatomic) NSMutableArray *navigationBarStack;

@property (nonatomic) YYNavigationBar *previousBar;
@property (nonatomic) CGFloat previousBarInitialNaviAlpha;
@property (nonatomic) CGFloat naviBarInitialNaviAlpha;

@property (nonatomic) YYNavigationBackType backType;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *screenEdgeGesture;
@property (nonatomic) UIPercentDrivenInteractiveTransition *interactivePopTransition;


@end

@implementation YYNavigationController

#pragma mark - LifeCycle

- (void)awakeFromNib {
    
    [super awakeFromNib];
        
    [self setupCustomNavigationBar];
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        [self setupCustomNavigationBar];
    }
    
    return self;
}

#pragma mark - Setup

- (void)setupCustomNavigationBar {
    
    [self setupNativeNavigationBarDisenable];
    [self modifyNavigationBarWithCount:self.viewControllers.count];
    [self setupScreenEdgeGesture];
}

- (void)setupNativeNavigationBarDisenable {
    
    self.navigationBar.hidden = YES;
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)setupScreenEdgeGesture {
    
    self.delegate = self;
    [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.screenEdgeGesture];
    self.backType = kYYNavigationBackTypeButton;
}

#pragma mark - ModifyNavigationBar

- (void)modifyNavigationBarWithCount:(NSUInteger)count {

    if (count > self.navigationBarStack.count) {
        
        [self addNavigationBar];
    } else if (count < self.navigationBarStack.count) {
        
        [self removeNavigationBar];
    }
}

- (void)addNavigationBar {
    
    [self.navigationBarStack addObject:[YYNavigationBar naviBarWithStackCount:self.viewControllers.count lastViewController:self.viewControllers.lastObject]];
    
    [self showNavigationBar];
}

- (void)removeNavigationBar {
    
    NSUInteger beginIndex = self.viewControllers.count;
    NSUInteger endIndex = self.navigationBarStack.count;

    for (NSUInteger i = beginIndex; i < endIndex; i++) {
        
        [self.navigationBarStack removeLastObject];
    }
    
    [self showNavigationBar];
}

- (void)showNavigationBar {
    
    if (self.naviBar.superview) {
        
        [self.naviBar removeFromSuperview];
    }
    
    [self setValue:self.navigationBarStack.lastObject forKey:@"naviBar"] ;
    [self setValue:self.naviBar.naviItem forKey:@"naviItem"];
    [self.view addSubview:self.naviBar];
    
    UIViewController *currentViewController = self.viewControllers.lastObject;
    [currentViewController setValue:self.naviBar forKey:@"naviBar"];
    [currentViewController setValue:self.naviItem forKey:@"naviItem"];
}

#pragma mark - ModifyPreviousNaviBar

- (void)popStateIsEqualBegin {

    self.backType = kYYNavigationBackTypeGesture;
    self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    [self popViewControllerAnimated:YES];
    
    self.naviBar.userInteractionEnabled = NO;
    
    self.previousBar = self.navigationBarStack[self.viewControllers.count - 1];
    [self.view insertSubview:self.previousBar belowSubview:self.naviBar];
    self.previousBar.userInteractionEnabled = NO;
    
    self.previousBarInitialNaviAlpha = self.previousBar.naviAlpha;
    self.naviBarInitialNaviAlpha = self.naviBar.naviAlpha;
}

- (void)popStateIsEqualChangedWithProcess:(CGFloat)process {
    
    [self.interactivePopTransition updateInteractiveTransition:process];

    CGFloat tempNaviAlpha = 0;
    CGFloat tempPreviousBarAlpha = 0;

    if (!self.naviBar.hidden) {
        
        tempNaviAlpha = MAX(0.0, MIN(self.naviBarInitialNaviAlpha, self.naviBarInitialNaviAlpha - process * 2));
    }
    
    if (!self.previousBar.hidden) {
        
        tempPreviousBarAlpha = MAX(0.0, MIN(self.naviBarInitialNaviAlpha, self.previousBarInitialNaviAlpha * process));
    }
    
    self.naviBar.naviAlpha = tempNaviAlpha;
    self.previousBar.naviAlpha = tempPreviousBarAlpha;
}

- (void)popStateIsEqualEndedOrCancelledWithProcess:(CGFloat)process {
    
    self.naviBar.userInteractionEnabled = YES;
    self.previousBar.userInteractionEnabled = YES;

    self.previousBar.naviAlpha = self.previousBarInitialNaviAlpha;
    
    [self.previousBar removeFromSuperview];
    self.previousBar = nil;
    
    if (process >= 0.5) {
        
        [self modifyNavigationBarWithCount:self.viewControllers.count];
        [self.interactivePopTransition finishInteractiveTransition];
    } else {
        
        self.naviBar.naviAlpha = self.naviBarInitialNaviAlpha;
        [self.interactivePopTransition cancelInteractiveTransition];
    }
    
    self.interactivePopTransition = nil;
    self.backType = kYYNavigationBackTypeButton;
}

#pragma mark - ReplaceSuperMethod

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [super pushViewController:viewController animated:animated];
    
    [self modifyNavigationBarWithCount:self.viewControllers.count];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    
    NSArray *tempArray = [super popToRootViewControllerAnimated:animated];
    
    [self modifyNavigationBarWithCount:self.viewControllers.count];
    
    return tempArray;
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    NSArray *tempArray = [super popToViewController:viewController animated:animated];
    
    [self modifyNavigationBarWithCount:self.viewControllers.count];
    
    return tempArray;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    UIViewController *viewController = [super popViewControllerAnimated:animated];
    
    if (self.backType == kYYNavigationBackTypeButton) {
        
        [self modifyNavigationBarWithCount:self.viewControllers.count];
    }
    
    return viewController;
}

#pragma mark - Push/Pop

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPop) {
        
        return [[YYNavigationPopAnimation alloc] init];
    }
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    if ([animationController isKindOfClass:[YYNavigationPopAnimation class]]) {
        
        return self.interactivePopTransition;
    }
    
    return nil;
}

#pragma mark - Action

- (void)customNavigationBarAnimation:(UIScreenEdgePanGestureRecognizer *)screenEdgeGesture {
    
    //    计算（相对于起始位置[手势开始位置]移动了多少个点）/ 屏幕宽度的比例, 用来当做滑动动画的进度
    CGFloat process = [screenEdgeGesture translationInView:self.view].x / self.view.bounds.size.width;
    //    防止值溢出0-1, MIN(1.0, process)确保了值不会大于1.0, MAX(0.0, X)确保了值不小于0.0
    process = MAX(0.0, MIN(1.0, process));
    
    UIGestureRecognizerState state = screenEdgeGesture.state;
    if (state == UIGestureRecognizerStateBegan) {

        [self popStateIsEqualBegin];
    } else if (state == UIGestureRecognizerStateChanged) {
       
        [self popStateIsEqualChangedWithProcess:process];
        
    } else if (state == UIGestureRecognizerStateEnded || state == UIGestureRecognizerStateCancelled) {
        
        [self popStateIsEqualEndedOrCancelledWithProcess:process];
    }
}

#pragma mark - Getter

- (NSMutableArray *)navigationBarStack {
    
    if (!_navigationBarStack) {
        
        _navigationBarStack = [NSMutableArray array];
    }
    
    return _navigationBarStack;
}

- (UIScreenEdgePanGestureRecognizer *)screenEdgeGesture {
    
    if (!_screenEdgeGesture) {
        
        _screenEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(customNavigationBarAnimation:)];
        _screenEdgeGesture.edges = UIRectEdgeLeft;
    }
    
    return _screenEdgeGesture;
}

@end
