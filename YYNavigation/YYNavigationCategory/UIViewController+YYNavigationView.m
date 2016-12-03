//
//  UIViewController+YYNavigationView.m
//  xxxx
//
//  Created by yangyang on 2016/11/13.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "UIViewController+YYNavigationView.h"
#import "YYNavigationBar.h"
#import "YYNavigationItem.h"
#import "YYNavigationController.h"
#import <objc/runtime.h>

static const void *kNavigationController = @"NavigationController";
static const void *kNavigationBar = @"NavigationBar";
static const void *kNavigationItem = @"NavigationItem";

@implementation UIViewController (YYNavigationView)

#pragma mark - Setter

- (void)setNaviController:(YYNavigationController *)naviController {
    
    objc_setAssociatedObject(self, kNavigationController, naviController, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setNaviBar:(YYNavigationBar *)naviBar {
    
    objc_setAssociatedObject(self, kNavigationBar, naviBar, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setNaviItem:(YYNavigationItem *)naviItem {
    
    objc_setAssociatedObject(self, kNavigationItem, naviItem, OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - Getter

- (YYNavigationController *)naviController {
    
    return objc_getAssociatedObject(self, kNavigationController);
}

- (YYNavigationBar *)naviBar {
    
    return objc_getAssociatedObject(self, kNavigationBar);
}

- (YYNavigationItem *)naviItem {
    
    return objc_getAssociatedObject(self, kNavigationItem);
}

@end
