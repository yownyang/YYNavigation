//
//  SecondViewController.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "SecondViewController.h"
#import "YYNavigation.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    // 恢复原样，方便调试
    if (self.selectIndex == 15 || self.selectIndex == 16) {

        self.naviController.gestureType = kYYNavigationGestureScreenEdgeType;
    }
}

- (void)setSelectIndex:(NSUInteger)selectIndex {
    
    if (selectIndex == 0) {
        
        self.naviItem.title = @"四种调用方式的结果是一样的";
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
        
        label.numberOfLines = 0;
        
        label.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@", self.naviItem.title, self.naviBar.naviItem.title, self.navigationController.naviItem.title, self.navigationController.naviBar.naviItem.title];
        [self.view addSubview:label];
    } else if (selectIndex == 1) {
        
        self.naviItem.title = @"隐藏/显示";
        self.naviBar.isHiddenNaviBar = YES;
        
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
        [sw addTarget:self action:@selector(onOff1:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sw];
        
    } else if (selectIndex == 2) {
        
        self.naviItem.title = @"设置naviBgColor";
        self.naviBar.naviBgColor = [UIColor blueColor];
    } else if (selectIndex == 3) {
        
        self.naviItem.title = @"半透明(子视图一起透明)";
        self.naviBar.naviAlpha = 0.5;
    } else if (selectIndex == 4) {
        
        self.naviItem.title = @"半透明(子视图不会透明)";
        self.naviBar.naviSuperAlpha = 0.5;
    } else if (selectIndex == 5) {
        
        self.naviItem.title = @"自定义标题";
    } else if (selectIndex == 6) {
        
        self.naviItem.title = @"自定义titleview";
        
        UISearchBar *sb = [[UISearchBar alloc] init];
        // 记得将自定义titleview的颜色与naviBgColor颜色一致哦
        sb.barTintColor = [UIColor darkGrayColor];
        self.naviItem.titleView = sb;
        
    } else if (selectIndex == 7) {
        
        self.naviItem.title = @"重写返回按钮";
        self.naviItem.backButton = [YYNavigationBarButton createButtonWithSize:CGSizeZero image:@"back" title:@"返回" handler:^(UIButton *sender) {
            
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
    } else if (selectIndex == 8) {
        
        self.naviItem.title = @"是否隐藏返回按钮";
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
        [sw addTarget:self action:@selector(onOff2:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sw];
    } else if (selectIndex == 9) {
        
        self.naviItem.title = @"设置本界面以及将要创建界面的文本颜色";
        self.naviItem.textColor = [UIColor blueColor];
    } else if (selectIndex == 10) {
        
        self.naviItem.title = @"分割线颜色";
        self.naviItem.lineColor = [UIColor greenColor];
    }  else if (selectIndex == 11) {
        
        self.naviItem.title = @"分割线图片";
        self.naviItem.lineImageName = @"line";
    } else if (selectIndex == 12) {
        
        self.naviItem.title = @"自定义左按钮集合";

        YYNavigationBarButton *b1 = [YYNavigationBarButton createButtonWithSize:CGSizeZero title:@"左按钮1" handler:^(UIButton *sender) {
        
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        YYNavigationBarButton *b2 = [YYNavigationBarButton createButtonWithSize:CGSizeZero title:@"左按钮2" handler:^(UIButton *sender) {
        
            self.naviItem.title = @"自定义左按钮2";
        }];
        
        self.naviItem.leftButtons = @[b1, b2];

    } else if (selectIndex == 13) {
        
        self.naviItem.title = @"自定义右按钮集合";

        YYNavigationBarButton *b3 = [YYNavigationBarButton createButtonWithSize:CGSizeZero title:@"右按钮1" handler:^(UIButton *sender) {
            
            self.naviItem.title = @"自定义右按钮1";
        }];
        
        YYNavigationBarButton *b4 = [YYNavigationBarButton createButtonWithSize:CGSizeZero title:@"右按钮2" handler:^(UIButton *sender) {
            
            self.naviItem.title = @"自定义右按钮2";
        }];
        
        self.naviItem.rightButtons = @[b3, b4];
    } else if (selectIndex == 15) {
        
        self.naviItem.title = @"全屏侧滑返回";
        self.naviController.gestureType = kYYNavigationGestureFullScreenType;
        
    } else if (selectIndex == 16) {
        
        self.naviItem.title = @"无侧滑返回";
        self.naviController.gestureType = kYYNavigationGestureNoneType;
    }
}

#pragma mark - Action

- (void)onOff1:(UISwitch *)swicth {
    
    self.naviBar.isHiddenNaviBar = !swicth.isOn;
}

- (void)onOff2:(UISwitch *)swicth {
    
    self.naviItem.isHiddenBackButton = swicth.isOn;
}

@end
