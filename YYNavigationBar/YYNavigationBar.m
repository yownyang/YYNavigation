//
//  YYNavigationBar.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "YYNavigationBar.h"

@interface YYNavigationBar ()
{
    NSArray *_viewArrays;
}

@end

@implementation YYNavigationBar

#pragma mark 初始化方法
+ (instancetype)initWithViewArrays:(NSArray *)viewArrays {
    
    YYNavigationBar *navigationBar = [[YYNavigationBar alloc]initWithViewArrays:viewArrays];
    
    return navigationBar;
}

- (instancetype)initWithViewArrays:(NSArray *)viewArrays {
    
    self = [super init];
    
    if (self) {
        
        [self setFrame:CGRectMake(0, 0, View_Width, NavBarHeight + StatusBarHeight)];
        
        [self setNaviBgColor:[UIColor darkGrayColor]];
        
        [self setNaviAlpha:1.0];
        
        _viewArrays = [NSArray arrayWithArray:viewArrays];
        
        [self addSubview:self.navigationItem];
        
        UIViewController *lastVC = [viewArrays lastObject];
        
        lastVC.naviItem = self.navigationItem;
        
        [lastVC.view addSubview:self];
    }
    
    return self;
}

#pragma mark setter方法
- (void)setIsHiddenNavi:(BOOL)isHiddenNavi {
    
    _isHiddenNavi = isHiddenNavi;
    
    self.hidden = isHiddenNavi;
}

- (void)setNaviBgColor:(UIColor *)naviBgColor {
    
    _naviBgColor = naviBgColor;
    
    self.backgroundColor = naviBgColor;
}

- (void)setNaviAlpha:(CGFloat)naviAlpha {
    
    _naviAlpha = naviAlpha;
    
    self.alpha = naviAlpha;
}

- (void)setNaviSuperAlpha:(CGFloat)naviSuperAlpha {
    
    _naviSuperAlpha = naviSuperAlpha;
    
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:_naviSuperAlpha];
}

#pragma mark getter方法
- (YYNavigationItem *)navigationItem {
    
    if (!_navigationItem) {
        
        _navigationItem = [YYNavigationItem initWithViewArrays:_viewArrays];
    }
    
    return _navigationItem;
}

@end
