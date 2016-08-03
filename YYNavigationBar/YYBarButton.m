//
//  YYBarButton.m
//  YYNavigationBar
//
//  Created by yangyang on 16/8/2.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "YYBarButton.h"

@interface YYBarButton ()

@property (nonatomic, strong) TapHandler handler;

@end

@implementation YYBarButton

#pragma mark 初始化
+ (instancetype)createButtonWithSize:(CGSize)size title:(NSString *)title handler:(TapHandler)handler {
    
    NSAssert(title != nil, @"文字不能为空");
    
    YYBarButton *button = [YYBarButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button.titleLabel setFont:[UIFont systemFontOfSize:ButtonFont]];
    
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        
        [button sizeToFit];
    }else {
        
        button.size = size;
    }

    button.handler = handler;
    
    [button addTarget:button action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (instancetype)createButtonWithSize:(CGSize)size image:(NSString *)image handler:(TapHandler)handler {
    
    NSAssert(image != nil, @"图片不能为空");
    
    YYBarButton *button = [YYBarButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];

    if (CGSizeEqualToSize(size, CGSizeZero)) {
        
        [button sizeToFit];
    }else {
        
        button.size = size;
    }
    
    button.handler = handler;
    
    [button addTarget:button action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (instancetype)createButtonWithSize:(CGSize)size image:(NSString *)image title:(NSString *)title handler:(TapHandler)handler {
    
    NSAssert(image != nil, @"图片不能为空");
    NSAssert(title != nil, @"文字不能为空");
    
    YYBarButton *button = [YYBarButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button.titleLabel setFont:[UIFont systemFontOfSize:ButtonFont]];
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        
        [button sizeToFit];
        button.width = button.width + 3;
    }else {
        
        button.size = size;
    }
    
    button.handler = handler;
    
    [button addTarget:button action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)btnTap:(UIButton *)sender {
    
    if (self.handler) {
        
        self.handler(sender);
    }
}

@end
