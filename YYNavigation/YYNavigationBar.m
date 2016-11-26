//
//  YYNavigationBar.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "YYNavigationBar.h"
#import "YYNavigationItem.h"
#import "YYNavigationMacro.h"

static NSString *const kBarBackgroundColor = @"kBarBackgroundColor";

@interface YYNavigationBar ()

@property (nonatomic) CGFloat stackCount;
@property (nonatomic) UIViewController *lastVC;

@property (nonatomic, readwrite) YYNavigationItem *naviItem;

@end

@implementation YYNavigationBar

#pragma mark - InitMethod

+ (instancetype)naviBarWithStackCount:(CGFloat)stackCount lastViewController:(UIViewController *)lastViewController {
    
    YYNavigationBar *navigationBar = [[YYNavigationBar alloc] initWithStackCount:stackCount lastViewController:lastViewController];
    
    return navigationBar;
}

- (instancetype)initWithStackCount:(CGFloat)stackCount lastViewController:(UIViewController *)lastViewController {
    
    self = [super init];
    
    if (self) {
        
        self.frame = CGRectMake(0, 0, YYViewWidth, YYNaviBarHeight + YYStatusBarHeight);
        
        self.stackCount = stackCount;
        self.lastVC = lastViewController;
        
        self.backgroundColor = [UIColor darkGrayColor];
        self.naviAlpha = 1.0;
        self.naviSuperAlpha = 1.0;
        
        [self addSubview:self.naviItem];
    }
    
    return self;
}

#pragma mark - SetterMethod

- (void)setIsHiddenNaviBar:(BOOL)isHiddenNaviBar {
    
    _isHiddenNaviBar = isHiddenNaviBar;
    
    self.hidden = isHiddenNaviBar;
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
    
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:naviSuperAlpha];
}

#pragma mark - GetterMethod

- (YYNavigationItem *)naviItem {
    
    if (!_naviItem) {
        
        _naviItem = [YYNavigationItem naviItemWithStackCount:self.stackCount lastViewController:self.lastVC];
    }
    
    return _naviItem;
}

@end
