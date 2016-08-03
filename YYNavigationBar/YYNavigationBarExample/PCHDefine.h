//
//  PCHDefine.h
//  LifeHelper
//
//  Created by yangyang on 15/8/3.
//  Copyright (c) 2015年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#ifndef PCHDefine_h
#define PCHDefine_h

#define R_G_B_A(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define View_Height  CGRectGetHeight([[UIScreen mainScreen]bounds])
#define View_Width   CGRectGetWidth([[UIScreen mainScreen]bounds])
#define NavBarHeight 44.0
#define StatusBarHeight 20.0

#define LabelFont 17.0
#define ButtonFont 15.0

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif

