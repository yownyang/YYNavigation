//
//  YYNavigationBar.h
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYNavigationItem;

@interface YYNavigationBar : UIView

// 是否隐藏自定义NavigationBar(默认显示)
@property (nonatomic) BOOL isHiddenNaviBar;

// 设置所有界面NavigationBar的背景色(默认黑灰色)
@property (nonatomic) UIColor *naviBgColor;

// 设置NavigationBar的透明度(默认1.0)
@property (nonatomic) CGFloat naviAlpha;

// 设置NavigationBar不影响子视图显示的透明度(默认1.0)
@property (nonatomic) CGFloat naviSuperAlpha;

// 用于加载视图等控件
@property (nonatomic, readonly) YYNavigationItem *naviItem;

/**
 实例初始化方法

 @param stackCount 传入当前NavigationController栈中的视图个数
 @param lastViewController 当前NavigationController栈中最后一个ViewController
 
 @return
 */
- (instancetype)initWithStackCount:(CGFloat)stackCount lastViewController:(UIViewController *)lastViewController;

/**
 类初始化方法

 @param stackCount 传入当前NavigationController栈中的视图个数
 @param lastViewController 当前NavigationController栈中最后一个ViewController
 
 @return
 */
+ (instancetype)naviBarWithStackCount:(CGFloat)stackCount lastViewController:(UIViewController *)lastViewController;

@end
