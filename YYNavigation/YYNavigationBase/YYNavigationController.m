//
//  YYNavigationController.m
//  YYNavigationBarExample
//
//  Created by yangyang on 2016/11/11.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "YYNavigationController.h"
#import "YYNavigationBar.h"
#import "YYNavigationItem.h"
#import "YYNavigationPushAnimaiton.h"
#import "YYNavigationPopAnimation.h"
#import "UIViewController+YYNavigationView.h"

static void *kYYNaviBarBGColor = @"kYYNaviBarBGColor";
static void *kYYNaviItemTextColor = @"kYYNaviItemTextColor";

typedef NS_ENUM(NSUInteger, YYNavigationBackType) {
    
    kYYNavigationBackTypeButton = 0,
    kYYNavigationBackTypeGesture
};

@interface YYNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic) NSMutableArray *navigationBarStack;

@property (nonatomic) YYNavigationBar *previousBar;
@property (nonatomic) CGFloat previousBarInitialNaviAlpha;
@property (nonatomic) CGFloat naviBarInitialNaviAlpha;

@property (nonatomic) YYNavigationBackType backType;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *screenEdgeGesture;
@property (nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@end

@implementation YYNavigationController

#pragma mark - LifeCycle

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController gestureType:(YYNavigationGestureType)gestureType {
    
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {
        
        [self setupCustomNavigationBar];
       
        if (!gestureType) {
            
            [self setGestureType:kYYNavigationGestureScreenEdgeType];
        } else {
            
            [self setGestureType:gestureType];
        }
    }
    
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    return [self initWithRootViewController:rootViewController gestureType:kYYNavigationGestureScreenEdgeType];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
        
    [self setupCustomNavigationBar];
    [self setGestureType:kYYNavigationGestureScreenEdgeType];
}

- (void)dealloc {
    
    [self removeAllObserve];
}

#pragma mark - Setup

- (void)setupCustomNavigationBar {
    
    [self modifyNavigationBarWithCount:self.viewControllers.count];
    [self setupNativeNavigationBarDisenable];
}

- (void)setupNativeNavigationBarDisenable {
    
    self.navigationBar.hidden = YES;
    self.interactivePopGestureRecognizer.enabled = NO;
}

#pragma mark - KVO

- (void)addObserver {
    
    [self.navigationBarStack.lastObject addObserver:self forKeyPath:@"naviBgColor" options:NSKeyValueObservingOptionNew context:kYYNaviBarBGColor];
    
    [self.navigationBarStack.lastObject addObserver:self forKeyPath:@"naviItem.textColor" options:NSKeyValueObservingOptionNew context:kYYNaviItemTextColor];
}

- (void)removeObserve {
        
    [self.navigationBarStack.lastObject removeObserver:self forKeyPath:@"naviBgColor"];
    [self.navigationBarStack.lastObject removeObserver:self forKeyPath:@"naviItem.textColor"];
}

- (void)removeAllObserve {
    
    [self.navigationBarStack enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [obj removeObserver:self forKeyPath:@"naviBgColor"];
        [obj removeObserver:self forKeyPath:@"naviItem.textColor"];
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (context == kYYNaviBarBGColor) {
        
        [[YYNavigationBar appearance] setNaviBgColor:change[NSKeyValueChangeNewKey]];
        
    } else if (context == kYYNaviItemTextColor) {
        
        [[YYNavigationItem appearance] setTextColor:change[NSKeyValueChangeNewKey]];
        
    } else {
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
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
    [self addObserver];
    [self showNavigationBar];
}

- (void)removeNavigationBar {
    
    NSUInteger beginIndex = self.viewControllers.count;
    NSUInteger endIndex = self.navigationBarStack.count;
    
    for (NSUInteger i = beginIndex; i < endIndex; i++) {
        
        [self removeObserve];
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
    [currentViewController setValue:self forKey:@"naviController"];
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

#pragma mark - ModifyGesture

- (void)addScreenGesture:(UIGestureRecognizer *)gesture {
    
    self.delegate = self;
    [self.interactivePopGestureRecognizer.view addGestureRecognizer:gesture];
    self.backType = kYYNavigationBackTypeButton;
}

- (void)removeScreenGesture:(UIGestureRecognizer *)gesture {
    
    [self.interactivePopGestureRecognizer.view removeGestureRecognizer:gesture];
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

#pragma mark - NavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPop) {
        
        return [[YYNavigationPopAnimation alloc] init];
    } else if (operation == UINavigationControllerOperationPush) {
        
        return [[YYNavigationPushAnimaiton alloc] init];
    }
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    if ([animationController isKindOfClass:[YYNavigationPopAnimation class]]) {
        
        return self.interactivePopTransition;
    }
    
    return nil;
}

#pragma mark - GestureDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if (self.viewControllers.count == 1) {
        
        return NO;
    } else {
        
        return YES;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if (gestureRecognizer == self.screenEdgeGesture || self.panGesture) {
        
        return YES;
    }
    
    return NO;
}

#pragma mark - Action

- (void)customNavigationBarAnimation:(UIPanGestureRecognizer *)gesture {
    
    //    计算（相对于起始位置[手势开始位置]移动了多少个点）/ 屏幕宽度的比例, 用来当做滑动动画的进度
    CGFloat process = [gesture translationInView:self.view].x / self.view.bounds.size.width;
    //    防止值溢出0-1, MIN(1.0, process)确保了值不会大于1.0, MAX(0.0, X)确保了值不小于0.0
    process = MAX(0.0, MIN(1.0, process));
    
    UIGestureRecognizerState state = gesture.state;
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
        _screenEdgeGesture.delegate = self;
        _screenEdgeGesture.edges = UIRectEdgeLeft;
    }
    
    return _screenEdgeGesture;
}

- (UIPanGestureRecognizer *)panGesture {
    
    if (!_panGesture) {
        
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(customNavigationBarAnimation:)];
        _panGesture.delegate = self;
    }
    
    return _panGesture;
}

#pragma mark - Setter

- (void)setGestureType:(YYNavigationGestureType)gestureType {
    
    switch (gestureType) {
        case kYYNavigationGestureNoneType:
            
            [self removeScreenGesture:self.screenEdgeGesture];
            [self removeScreenGesture:self.panGesture];
            break;
        case kYYNavigationGestureScreenEdgeType:
            
            [self removeScreenGesture:self.panGesture];
            [self addScreenGesture:self.screenEdgeGesture];

            break;
        case kYYNavigationGestureFullScreenType:
            
            [self removeScreenGesture:self.screenEdgeGesture];
            [self addScreenGesture:self.panGesture];
            break;
    }
}

@end
