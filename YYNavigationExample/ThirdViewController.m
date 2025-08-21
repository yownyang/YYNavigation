//
//  ThirdViewController.m
//  YYNavigationExample
//
//  Created by yangyang on 2016/12/3.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "ThirdViewController.h"
#import "SecondViewController.h"

#import "YYNavigation.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.yy_navigationItem.title = @"ThirdViewController";
    self.yy_navigationItem.backButton = [YYNavigationBarButton buttonWithImage:[UIImage imageNamed:@"back"] title:@"返回" handler:^(UIButton *sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    @weakify(self);
    YYNavigationBarButton *b1 = [YYNavigationBarButton buttonWithTitle:@"跳转测试" handler:^(UIButton *sender) {
        @strongify(self);
        SecondViewController *sc = [SecondViewController new];
        sc.selectIndex = 0;
        sc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sc animated:YES];
    }];
    self.yy_navigationItem.rightButtons = @[b1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
