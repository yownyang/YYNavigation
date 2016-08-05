//
//  FirstViewController.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationController.naviItem.title = @"首页";
        
    YYBarButton *b1 = [YYBarButton createButtonWithSize:CGSizeZero title:@"左按钮1" handler:^(UIButton *sender) {
        
        NSLog(@"左按钮1");
    }];
    
    YYBarButton *b2 = [YYBarButton createButtonWithSize:CGSizeZero title:@"左按钮2" handler:^(UIButton *sender) {
        
        NSLog(@"左按钮2");
    }];
    
    YYBarButton *b3 = [YYBarButton createButtonWithSize:CGSizeZero title:@"右按钮1" handler:^(UIButton *sender) {
        
        NSLog(@"右按钮1");
    }];
    
    YYBarButton *b4 = [YYBarButton createButtonWithSize:CGSizeZero title:@"右按钮2" handler:^(UIButton *sender) {
        
        NSLog(@"右按钮2");
    }];
    
    self.navigationController.naviItem.leftButtons = @[b1, b2];
    
    self.navigationController.naviItem.rightButtons = @[b3, b4];
    
    self.navigationController.naviItem.lineColor = [UIColor greenColor];
}

@end
