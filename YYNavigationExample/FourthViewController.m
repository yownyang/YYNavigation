//
//  FourthViewController.m
//  YYNavigationExample
//
//  Created by Yown on 2024/2/6.
//  Copyright © 2024 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "FourthViewController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"
#import "Masonry.h"
#import "YYNavigation.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.yy_navigationItem.title = @"一次性返回多个界面";
    self.view.backgroundColor = [UIColor brownColor];

    UIButton *popToRootButton = [UIButton buttonWithType:UIButtonTypeCustom];
    popToRootButton.layer.masksToBounds = YES;
    popToRootButton.layer.cornerRadius = 10;
    popToRootButton.backgroundColor = [UIColor blueColor];
    [popToRootButton setTitle:@"返回到栈顶" forState:UIControlStateNormal];
    [popToRootButton addTarget:self action:@selector(clickPopToRootButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popToRootButton];
    [popToRootButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.right.mas_equalTo(-22);
        make.height.mas_equalTo(50);
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(YYNaviBarHeight + 100);
    }];
    
    UIButton *popToViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    popToViewControllerButton.layer.masksToBounds = YES;
    popToViewControllerButton.layer.cornerRadius = 10;
    popToViewControllerButton.backgroundColor = [UIColor blueColor];
    [popToViewControllerButton setTitle:@"返回到栈中某一个" forState:UIControlStateNormal];
    [popToViewControllerButton addTarget:self action:@selector(clickPopToViewControllerButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popToViewControllerButton];
    [popToViewControllerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.right.mas_equalTo(-22);
        make.height.mas_equalTo(50);
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(YYNaviBarHeight + 200);
    }];
    
    UIButton *setViewControllersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    setViewControllersButton.layer.masksToBounds = YES;
    setViewControllersButton.layer.cornerRadius = 10;
    setViewControllersButton.backgroundColor = [UIColor blueColor];
    [setViewControllersButton setTitle:@"setViewController" forState:UIControlStateNormal];
    [setViewControllersButton addTarget:self action:@selector(clickSetViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setViewControllersButton];
    [setViewControllersButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.right.mas_equalTo(-22);
        make.height.mas_equalTo(50);
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(YYNaviBarHeight + 300);
    }];
}

#pragma mark - Action

- (void)clickPopToRootButton {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)clickPopToViewControllerButton {
    UIViewController *vc = self.yy_navigationController.viewControllers[0];
    [self.navigationController popToViewController:vc animated:YES];
}

- (void)clickSetViewController {
//    FirstViewController *vc1 = [FirstViewController new];
//    FourthViewController *vc2 = [FourthViewController new];
//    SecondViewController *vc3 = [SecondViewController new];
//    
//    [self.navigationController setViewControllers:@[vc1, vc2, vc3] animated:YES];
    
    NSMutableArray *array = [NSMutableArray arrayWithObject:self.navigationController.viewControllers.firstObject];
    [self.navigationController setViewControllers:[array copy] animated:YES];
}

@end
