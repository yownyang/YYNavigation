//
//  FirstViewController.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

#import <YYNavigation/YYNavigation.h>
#import <Masonry/Masonry.h>

@interface FirstViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;
@property (nonatomic, copy) NSArray *textArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 用于在iPhone X中标示下边的操作区
    self.view.backgroundColor = [UIColor brownColor];
    
    // 设置本界面的标题
    self.yy_navigationItem.title = @"Demo";
    
    //系统会自动调节ScrollView的Insets，在Push界面，POP时也都会，所以如果哪个界面，设置了系统导航栏为隐藏，那么就设置这个为NO，否则会出现很多奇奇怪怪的情况
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //  懒得写getter方法了。。。。
    self.textArray = @[@"Category类中属性的用法",
                      @"是否隐藏自定义NavigationBar",
                      @"设置NavigationBar的背景色",
                      @"设置NavigationBar的透明度",
                      @"设置NavigationBar不影响子视图显示的透明度",
                      @"设置标题",
                      @"自定义标题View",
                      @"重写返回按钮",
                      @"设置返回按钮是否隐藏",
                      @"设置本界面的文本颜色",
                      @"分割线颜色",
                      @"分割线图片",
                      @"左边按钮集合",
                      @"右边按钮集合",
                      @"代码初始化YYNavigationController",
                      @"全屏侧滑返回",
                      @"无侧滑返回",
                      @"一次性返回多个界面",
                      @"设置本界面的文本字体"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

//// 这个是使用Masonry布局。系统不会考虑自定义导航栏占得位置，这个44是自定义导航栏的实际高度，所以要向下平移44
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        if (@available(iOS 11.0, *)) {
//            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(44);
//            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
//            make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft);
//            make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight);
//        } else {
//            make.top.mas_equalTo(self.view.mas_top).offset(44);
//            make.bottom.mas_equalTo(self.view.mas_bottom);
//            make.left.mas_equalTo(self.view.mas_left);
//            make.right.mas_equalTo(self.view.mas_right);
//        }
//    }];
//}

// 这个是使用Frame布局。系统不会考虑自定义导航栏占得位置，44是自定义导航栏的实际高度，所以要向下平移44
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (@available(iOS 11.0, *)) {
        CGRect safeAreaFrame = self.view.safeAreaLayoutGuide.layoutFrame;
        self.tableView.frame = CGRectMake(0, safeAreaFrame.origin.y + 44, safeAreaFrame.size.width, safeAreaFrame.size.height - 44);
    } else {
        self.tableView.frame = CGRectMake(0, YYNaviBarHeight, self.view.width, self.view.height - YYNaviBarHeight);
    }
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.textArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = self.textArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 14) {
        ThirdViewController *viewController1 = [[ThirdViewController alloc] init];
        ThirdViewController *viewController2 = [[ThirdViewController alloc] init];

        UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
        UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
        
        YYNavigationController *navigationController1 = [[YYNavigationController alloc] initWithRootViewController:viewController1 gestureType:kYYNavigationGestureFullScreenType];
        navigationController1.tabBarItem = firstItem;
        YYNavigationController *navigationController2 = [[YYNavigationController alloc] initWithRootViewController:viewController2];
        navigationController2.tabBarItem = secondItem;

        UITabBarController *tabbarController = [[UITabBarController alloc] init];
        tabbarController.viewControllers = @[navigationController1, navigationController2];
        tabbarController.modalPresentationStyle = UIModalPresentationFullScreen;
        // 如果跳转的下个界面是tabbarController，必须用present推送
        [self presentViewController:tabbarController animated:YES completion:nil];
       
    } else {
        
        SecondViewController *sc = [SecondViewController new];
        sc.selectIndex = indexPath.row;
        [self.navigationController pushViewController:sc animated:YES];
    }
}

@end
