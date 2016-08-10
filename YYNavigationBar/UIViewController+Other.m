//
//  UIViewController+Other.m
//  YYNavigationBarExample
//
//  Created by yangyang on 16/8/10.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "UIViewController+Other.h"
#import <objc/runtime.h>

@implementation UIViewController (Other)

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
