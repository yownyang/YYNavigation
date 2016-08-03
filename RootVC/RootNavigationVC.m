//
//  BaseNaviViewController.m
//  ehu
//
//  Created by 静默 on 15/11/24.
//  Copyright © 2015年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "RootNavigationVC.h"
#import <objc/runtime.h>

@implementation RootNavigationVC

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end


@implementation UINavigationController (Other)

- (void)setNaviBar:(YYNavigationBar *)naviBar {
    
    objc_setAssociatedObject(self, @"NaviBar", naviBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YYNavigationBar *)naviBar {
    
    return objc_getAssociatedObject(self, @"NaviBar");
}

- (void)setNaviItem:(YYNavigationItem *)naviItem {
    
    objc_setAssociatedObject(self, @"NaviItem", naviItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YYNavigationItem *)naviItem {
    
    return objc_getAssociatedObject(self, @"NaviItem");
}
@end