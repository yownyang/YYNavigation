//
//  YYNavigationController.h
//  YYNavigationBarExample
//
//  Created by yangyang on 2016/11/11.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YYNavigationGestureType) {
    
    kYYNavigationGestureNoneType = 0,
    kYYNavigationGestureScreenEdgeType,
    kYYNavigationGestureFullScreenType,
};

@interface YYNavigationController : UINavigationController

/**
 初始化一个NavigationController, 侧滑返回类型为边缘返回

 @param rootViewController 第一个ViewController
 @return 
 */
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;

/**
 初始化一个NavigationController

 @param rootViewController 第一个ViewController
 @param gestureType 侧滑返回的手势类型
 @return
 */
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController gestureType:(YYNavigationGestureType)gestureType;

// 侧滑返回的手势类型, 默认为边缘返回
@property (nonatomic) YYNavigationGestureType gestureType;

@end

