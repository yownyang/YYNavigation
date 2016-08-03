//
//  RootVC.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "RootVC.h"
#import "YYNavigationBar.h"

@interface RootVC ()

@end

@implementation RootVC

#pragma mark 生命周期
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.naviBar = [[YYNavigationBar alloc]initWithViewArrays:self.navigationController.viewControllers];
}

@end
