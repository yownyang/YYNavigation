//
//  OtherSecondVC.m
//  YYNavigationBarExample
//
//  Created by yangyang on 16/8/10.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "OtherSecondVC.h"

@interface OtherSecondVC ()

@end

@implementation OtherSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.naviItem.title = @"另一个视图---2";
    
    self.naviItem.backButton = [YYBarButton createButtonWithSize:CGSizeZero image:@"back" title:@"返回" handler:^(UIButton *sender) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
