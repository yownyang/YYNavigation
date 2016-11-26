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
#import <objc/runtime.h>

static const void *kNavigationBar = @"NavigationBar";
static const void *kNavigationItem = @"NavigationItem";

@implementation UIViewController (YYNavigationView)

- (void)setNaviBar:(YYNavigationBar *)naviBar {
    
    objc_setAssociatedObject(self, kNavigationBar, naviBar, OBJC_ASSOCIATION_ASSIGN);
}

- (YYNavigationBar *)naviBar {
    
    return objc_getAssociatedObject(self, kNavigationBar);
}

- (void)setNaviItem:(YYNavigationItem *)naviItem {
    
    objc_setAssociatedObject(self, kNavigationItem, naviItem, OBJC_ASSOCIATION_ASSIGN);
}

- (YYNavigationItem *)naviItem {
    
    return objc_getAssociatedObject(self, kNavigationItem);
}

@end
