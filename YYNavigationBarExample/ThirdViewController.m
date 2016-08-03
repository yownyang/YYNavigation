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
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
