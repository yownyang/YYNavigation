//
//  FirstViewController.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation FirstViewController

#warning 如果你的ViewController不是继承与RootVC，那么需要你在每个ViewController中写上这么一句话self.naviBar = [YYNavigationBar initWithViewArrays:self.navigationController.viewControllers];

- (void)viewDidLoad {

    [super viewDidLoad];
    
//    系统会自动调节ScrollView的Insets，在Push界面，POP时也都会，所以如果哪个界面，设置了系统导航栏为隐藏，那么就设置这个，否则会出现很多奇奇怪怪的情况
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.naviItem.title = @"首页";
        
    YYBarButton *b1 = [YYBarButton createButtonWithSize:CGSizeZero title:@"左按钮1" handler:^(UIButton *sender) {
        
        NSLog(@"左按钮1");
    }];
    
    YYBarButton *b2 = [YYBarButton createButtonWithSize:CGSizeZero title:@"左按钮2" handler:^(UIButton *sender) {
        
        NSLog(@"左按钮2");
    }];
    
    YYBarButton *b3 = [YYBarButton createButtonWithSize:CGSizeZero title:@"右按钮1" handler:^(UIButton *sender) {
        
        NSLog(@"右按钮1");
    }];
    
    YYBarButton *b4 = [YYBarButton createButtonWithSize:CGSizeZero title:@"跳转下一个界面" handler:^(UIButton *sender) {
        
        SecondViewController *sc = (SecondViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"SecondViewController"];
        
        [self.navigationController pushViewController:sc animated:YES];
    }];
    
    self.naviItem.leftButtons = @[b1, b2];
    
    self.naviItem.rightButtons = @[b3, b4];
    
//    self.naviItem.lineColor = [UIColor greenColor];
    
    [self.view addSubview:self.scrollView];
    
    [self.view bringSubviewToFront:self.naviBar];
}

- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        
        _scrollView.backgroundColor = [UIColor brownColor];
        
        _scrollView.contentSize = CGSizeMake(self.view.width, self.view.height + 200);
        
        _scrollView.delegate = self;
    }
    
    return _scrollView;
}

#pragma mark ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //    获得当前的contentOffset.y
    CGFloat scrollY = scrollView.contentOffset.y;
    
    //    滑动这个高度完全透明, alpha为1
    float totalHeight = 64;
    
    //    计算透明度
    float navigationViewAlpha = ((totalHeight - scrollY) / totalHeight);
    
    //    最大为1，最小为0
    navigationViewAlpha = MIN(1, MAX(0, navigationViewAlpha));
    
    self.naviBar.naviSuperAlpha = navigationViewAlpha;
}

@end
