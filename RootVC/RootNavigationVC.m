//
//  BaseNaviViewController.m
//  ehu
//
//  Created by 静默 on 15/11/24.
//  Copyright © 2015年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "RootNavigationVC.h"

@implementation RootNavigationVC

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
//    这个用于拥有tabbar时的跳转隐藏tabbar，跟自定义naviBar无关
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
