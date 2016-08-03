//
//  YYNavigationBar.h
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYNavigationItem.h"

@interface YYNavigationBar : UIView

// 是否隐藏自定义NavigationBar(默认显示)
@property (nonatomic, assign) BOOL isHiddenNavi;

// 设置NavigationBar的背景色(默认黑灰色)
@property (nonatomic, strong) UIColor *naviBgColor;

// 设置NavigationBar的透明度(默认1.0)
@property (nonatomic, assign) CGFloat naviAlpha;

// 用于加载视图等控件
@property (nonatomic, strong) YYNavigationItem *navigationItem;

/**
 *  实例初始化方法
 *
 *  @param viewCounts 传入当前NavigationController栈中的视图
 *
 *  @return 
 */
- (instancetype)initWithViewArrays:(NSArray *)viewArrays;

/**
 *  类初始化方法
 *
 *  @param viewCounts 传入当前NavigationController栈中的视图
 *
 *  @return 
 */
+ (instancetype)initWithViewArrays:(NSArray *)viewArrays;

@end
