//
//  SecondViewController.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "SecondViewController.h"
#import "FourthViewController.h"

#import "YYNavigation.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    [self reloadView:self.selectIndex];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    // 恢复原样，方便调试
    self.yy_navigationController.gestureType = kYYNavigationGestureScreenEdgeType;
}

- (void)reloadView:(NSUInteger)selectIndex {
    if (selectIndex == 0) {
        
        self.yy_navigationItem.title = @"Category类中属性的用法";
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
        
        label.numberOfLines = 0;
        
        label.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@", self.yy_navigationItem.title, self.yy_navigationBar.yy_navigationItem.title, self.navigationController.yy_navigationItem.title, self.navigationController.yy_navigationBar.yy_navigationItem.title];
        [self.view addSubview:label];
    } else if (selectIndex == 1) {
        
        self.yy_navigationItem.title = @"隐藏/显示";
        self.yy_navigationBar.isHiddenNaviBar = YES;
        
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
        [sw addTarget:self action:@selector(onOff1:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sw];
        
    } else if (selectIndex == 2) {
        
        self.yy_navigationItem.title = @"设置naviBgColor";
        self.yy_navigationBar.naviBgColor = [UIColor blueColor];
    } else if (selectIndex == 3) {
        
        self.yy_navigationItem.title = @"半透明(子视图一起透明)";
        self.yy_navigationBar.naviAlpha = 0.5;
    } else if (selectIndex == 4) {
        
        self.yy_navigationItem.title = @"半透明(子视图不会透明)";
        self.yy_navigationBar.naviSuperAlpha = 0.5;
    } else if (selectIndex == 5) {
        
        self.yy_navigationItem.title = @"自定义标题";
    } else if (selectIndex == 6) {
        
        self.yy_navigationItem.title = @"自定义titleview";
        
        UISearchBar *sb = [[UISearchBar alloc] init];
        // 记得将自定义titleview的颜色与naviBgColor颜色一致哦
        sb.barTintColor = [UIColor darkGrayColor];
        self.yy_navigationItem.titleView = sb;
        
    } else if (selectIndex == 7) {
        
        self.yy_navigationItem.title = @"重写返回按钮";
        self.yy_navigationItem.backButton = [YYNavigationBarButton buttonWithImage:[UIImage imageNamed:@"app_back"] title:@"返回" handler:^(UIButton *sender) {
            
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
    } else if (selectIndex == 8) {
        
        self.yy_navigationItem.title = @"是否隐藏返回按钮";
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
        [sw addTarget:self action:@selector(onOff2:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sw];
    } else if (selectIndex == 9) {
        
        self.yy_navigationItem.title = @"设置本界面的文本颜色";
        self.yy_navigationItem.textColor = [UIColor blueColor];
    } else if (selectIndex == 10) {
        
        self.yy_navigationItem.title = @"分割线颜色";
        self.yy_navigationItem.separatorLineColor = [UIColor greenColor];
    }  else if (selectIndex == 11) {
        
        self.yy_navigationItem.title = @"分割线图片";
        self.yy_navigationItem.separatorLineImage = [UIImage imageNamed:@"line"];
    } else if (selectIndex == 12) {
        
        self.yy_navigationItem.title = @"自定义左按钮集合";

        YYNavigationBarButton *b1 = [YYNavigationBarButton buttonWithTitle:@"left1" handler:^(UIButton *sender) {
        
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        YYNavigationBarButton *b2 = [YYNavigationBarButton buttonWithTitle:@"left2" handler:^(UIButton *sender) {
        
            self.yy_navigationItem.title = @"自定义左按钮2";
        }];
        
        self.yy_navigationItem.leftButtons = @[b1, b2];

    } else if (selectIndex == 13) {
        
        self.yy_navigationItem.title = @"自定义右按钮集合";

        YYNavigationBarButton *b3 = [YYNavigationBarButton buttonWithTitle:@"right1" handler:^(UIButton *sender) {
            
            self.yy_navigationItem.title = @"自定义右按钮1";
        }];
        
        YYNavigationBarButton *b4 = [YYNavigationBarButton buttonWithTitle:@"right2" handler:^(UIButton *sender) {
            
            self.yy_navigationItem.title = @"自定义右按钮2";
        }];
        
        self.yy_navigationItem.rightButtons = @[b3, b4];
    } else if (selectIndex == 15) {
        
        self.yy_navigationItem.title = @"全屏侧滑返回";
        self.yy_navigationController.gestureType = kYYNavigationGestureFullScreenType;
        
    } else if (selectIndex == 16) {
        
        self.yy_navigationItem.title = @"无侧滑返回";
        self.yy_navigationController.gestureType = kYYNavigationGestureNoneType;
    } else if (selectIndex == 17) {
        self.yy_navigationItem.title = @"中转界面";
        FourthViewController *sc = [FourthViewController new];
        [self.navigationController pushViewController:sc animated:YES];
    } else if (selectIndex == 18) {
        self.yy_navigationItem.title = @"设置本界面的文本字体";
        self.yy_navigationItem.textFont = [UIFont boldSystemFontOfSize:22];
    } else if (selectIndex == 19) {
        self.yy_navigationItem.title = @"导航栏重新布局";
        @weakify(self);
        YYNavigationBarButton *refreshButton = [YYNavigationBarButton buttonWithImage:[UIImage imageNamed:@"home_qa"] title:@"点击刷新" handler:^(UIButton *sender) {
            @strongify(self);
            [self.yy_navigationItem refreshSubLayout];
        }];
        
        self.yy_navigationItem.rightButtons = @[refreshButton];
        
        // 这部分代码对按钮的属性进行了修改，点击按钮布局会进行刷新
        // 修改文本大小
        refreshButton.titleLabel.font = [UIFont systemFontOfSize:10];
        // 将按钮调整为图片在上，文本在下
        CGFloat imageWith = refreshButton.imageView.frame.size.width;
        CGFloat imageHeight = refreshButton.imageView.frame.size.height;
        CGFloat labelWidth = refreshButton.titleLabel.intrinsicContentSize.width;
        CGFloat labelHeight = refreshButton.titleLabel.intrinsicContentSize.height;
        UIEdgeInsets imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-3/2.0, 0, 0, -labelWidth);
        UIEdgeInsets labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-3/2.0, 0);
        refreshButton.titleEdgeInsets = labelEdgeInsets;
        refreshButton.imageEdgeInsets = imageEdgeInsets;
        // 因为图片上文本下的时候，button的宽度还是文本+图片，所以要手动设置下
        refreshButton.width = imageWith > labelWidth ? imageWith : labelWidth;
    }
}

#pragma mark - Action

- (void)onOff1:(UISwitch *)swicth {
    
    self.yy_navigationBar.isHiddenNaviBar = !swicth.isOn;
}

- (void)onOff2:(UISwitch *)swicth {
    
    self.yy_navigationItem.isHiddenBackButton = swicth.isOn;
}

@end
