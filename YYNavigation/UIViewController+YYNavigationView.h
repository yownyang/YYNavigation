//
//  UIViewController+YYNavigationView.h
//  xxxx
//
//  Created by yangyang on 2016/11/13.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYNavigationBar, YYNavigationItem;

@interface UIViewController (YYNavigationView)

@property (nonatomic, readonly) YYNavigationBar *naviBar;

@property (nonatomic, readonly) YYNavigationItem *naviItem;

@end
