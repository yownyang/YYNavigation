//
//  UIImage+YYHelper.h
//  YYNavigationExample
//
//  Created by yown on 2022/2/22.
//  Copyright © 2022 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YYGradientDirection) {
    /// 从上到下
    kYYGradientDirectionTop = 0,
    /// 从左到右
    kYYGradientDirectionLeft = 1,
    /// 左上到右下
    kYYGradientDirectionUpleft = 2,
    /// 右上到左下
    kYYGradientDirectionUpright = 3,
};

@interface UIImage (YYHelper)

/// 使用渐变色生成渐变图片
+ (UIImage *)loadGradientImageFromGradientColors:(NSArray *)colors
                                       direction:(YYGradientDirection)direction
                                            size:(CGSize)size;

@end
