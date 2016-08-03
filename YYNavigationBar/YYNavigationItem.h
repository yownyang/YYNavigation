//
//  YYNavigationItem.h
//  YYNavigationBar
//
//  Created by yangyang on 16/8/1.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYNavigationItem : UIView

// 设置标题(默认为空)
@property (nonatomic, copy) NSString *title;

// 自定义标题(默认为空)
@property (nonatomic, strong) UIView *titleView;

// 返回按钮(默认隐藏)
@property (nonatomic, strong) UIButton *backButton;

// 所有本界面之后的文本的颜色(自定义除外)
@property (nonatomic, strong) UIColor *textColor;

// 分割线颜色
@property (nonatomic, strong) UIColor *lineColor;

// 分割线图片
@property (nonatomic, copy) NSString *lineImageName;

// 左边按钮集合
@property (nonatomic, copy) NSArray<UIButton *> *leftButtons;

// 右边按钮集合
@property (nonatomic, copy) NSArray<UIButton *> *rightButtons;


/**
 *  类初始化方法
 *
 *  @param viewCounts 传入当前NavigationController栈中的视图
 *
 *  @return
 */
+ (instancetype)initWithViewArrays:(NSArray *)viewArrays;

/**
 *  实例初始化方法
 *
 *  @param viewCounts 传入当前NavigationController栈中的视图
 *
 *  @return
 */
- (instancetype)initWithViewArrays:(NSArray *)viewArrays;

@end
