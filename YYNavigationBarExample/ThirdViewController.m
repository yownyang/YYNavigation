//
//  ThirdViewController.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
//    self.navigationController.naviBar.isHiddenNavi = YES;
    
//    YYBarButton *back = [YYBarButton createButtonWithSize:CGSizeZero image:@"back" handler:^(UIButton *sender){
//        
//        NSLog(@"back");
//        [self.navigationController popViewControllerAnimated:YES];
//    }];
    
    YYBarButton *back1 = [YYBarButton createButtonWithSize:CGSizeZero image:@"back" title:@"返回" handler:^(UIButton *sender) {
      
        NSLog(@"back1");
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    self.navigationController.naviItem.leftButtons = @[back1];
    
    self.navigationController.naviItem.title = @"ThirdVC";
    
    self.navigationController.naviBar.naviSuperAlpha = 0.0;
    
    self.navigationController.naviItem.textColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
