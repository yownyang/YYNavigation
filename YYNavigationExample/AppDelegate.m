//
//  AppDelegate.m
//  YYNavigationBar
//
//  Created by yangyang on 16/8/3.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "AppDelegate.h"

#import "UIImage+YYHelper.h"

#import <YYNavigation/YYNavigation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIImage *bgImage = [UIImage loadGradientImageFromGradientColors:@[[UIColor yellowColor], [UIColor redColor], [UIColor greenColor]] direction:kYYGradientDirectionLeft size:CGSizeMake(YYScreenWidth, [NSObject yy_naviBarHeight])];
    [[YYNavigationBar appearance] setNaviBgImage:bgImage];
    [[YYNavigationItem appearance] setTextColor:[UIColor whiteColor]];
    [[YYNavigationItem appearance] setBackImage:[UIImage imageNamed:@"app_back"]];
    return YES;
}


@end
