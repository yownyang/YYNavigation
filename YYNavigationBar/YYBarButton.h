//
//  YYBarButton.h
//  YYNavigationBar
//
//  Created by yangyang on 16/8/2.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapHandler)(UIButton *sender);

@interface YYBarButton : UIButton

/**
 *  创建一个文字button
 *
 *  @param size    button大小, 为空请填CGSizeZero
 *  @param title   button文字, 不可为空
 *  @param handler button点击
 *
 *  @return
 */
+ (instancetype)createButtonWithSize:(CGSize)size title:(NSString *)title handler:(TapHandler)handler;

/**
 *  创建一个图片button
 *
 *  @param size    button大小, 为空请填CGSizeZero
 *  @param image   button图片, 不可为空
 *  @param handler button点击
 *
 *  @return 
 */
+ (instancetype)createButtonWithSize:(CGSize)size image:(NSString *)image handler:(TapHandler)handler;

/**
 *  创建一个图片文字button
 *
 *  @param size    button大小, 为空请填CGSizeZero
 *  @param image   button图片, 不可为空
 *  @param title   button文字, 不可为空
 *  @param handler button点击
 *
 *  @return 
 */
+ (instancetype)createButtonWithSize:(CGSize)size image:(NSString *)image title:(NSString *)title handler:(TapHandler)handler;
@end
