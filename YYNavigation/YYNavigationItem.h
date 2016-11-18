//
//  YYNavigationItem.h
//  YYNavigationBar
//
//  Created by yangyang on 16/8/1.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYNavigationMacro.h"

@interface YYNavigationItem : UIView

// 设置标题(默认为nil)
@property (nonatomic, copy) NSString *title;

// 自定义标题View(默认为nil)
@property (nonatomic) UIView *titleView;

// 返回按钮(第一个界面隐藏, 默认一个返回的图片)
@property (nonatomic) UIButton *backButton;

// 设置返回按钮是否隐藏(默认为NO)
@property (nonatomic) BOOL isHiddenBackButton;

// 当前界面以及新生成界面的文本的颜色(默认白色。建议在viewWillAppear/viewWillDidAppear中设置)
@property (nonatomic) UIColor *textColor;

// 分割线颜色(默认无色)
@property (nonatomic) UIColor *lineColor;

// 分割线图片(默认无图)
@property (nonatomic, copy) NSString *lineImageName;

// 左边按钮集合(默认为nil, 只接受按钮类型的view)
@property (nonatomic, copy) NSArray<UIButton *> *leftButtons;

// 右边按钮集合(默认为nil, 只接受按钮类型的view)
@property (nonatomic, copy) NSArray<UIButton *> *rightButtons;


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
+ (instancetype)naviItemWithStackCount:(CGFloat)stackCount lastViewController:(UIViewController *)lastViewController;

@end
