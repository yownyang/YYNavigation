//
//  ThirdViewController.m
//  YYNavigationExample
//
//  Created by yangyang on 2016/12/3.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "ThirdViewController.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
