//
//  AppDelegate.m
//  YYNavigationBar
//
//  Created by yangyang on 16/8/3.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "AppDelegate.h"

#import "YYNavigation.h"

typedef NS_ENUM(NSUInteger, BIGradientDirection) {
        /// 从上到下
    kBIGradientDirectionTop = 0,
        /// 从左到右
    kBIGradientDirectionLeft = 1,
        /// 左上到右下
    kBIGradientDirectionUpleft = 2,
        /// 右上到左下
    kBIGradientDirectionUpright = 3,
};

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIImage *bgImage = [AppDelegate loadGradientImageFromGradientColors:@[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor]] direction:kBIGradientDirectionLeft size:CGSizeMake(YYScreenWidth, YYNaviBarHeight)];
    [[YYNavigationBar appearance] setNaviBgImage:bgImage];
    [[YYNavigationItem appearance] setTextColor:[UIColor brownColor]];

    return YES;
}

+ (UIImage *)loadGradientImageFromGradientColors:(NSArray *)colors direction:(BIGradientDirection)direction size:(CGSize)size {
    NSMutableArray *array = [NSMutableArray array];
    for (UIColor *color in colors) {
        [array addObject:(id)color.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)array, NULL);
    CGPoint start;
    CGPoint end;
    switch (direction) {
        case kBIGradientDirectionTop:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        case kBIGradientDirectionLeft:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, 0.0);
            break;
        case kBIGradientDirectionUpleft:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, size.height);
            break;
        case kBIGradientDirectionUpright:
            start = CGPointMake(size.width, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
