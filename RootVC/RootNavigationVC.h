//
//  BaseNaviViewController.h
//  ehu
//
//  Created by 静默 on 15/11/24.
//  Copyright (c) 机智的静默( http://www.cnblogs.com/jingmo/ ) All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYNavigationBar.h"
#import "YYNavigationItem.h"

@interface RootNavigationVC : UINavigationController

@end

@interface UINavigationController (Other)

@property (nonatomic, strong) YYNavigationBar *naviBar;

@property (nonatomic, strong) YYNavigationItem *naviItem;

@end