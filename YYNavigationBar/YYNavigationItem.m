//
//  YYNavigationItem.m
//  YYNavigationBar
//
//  Created by yangyang on 16/8/1.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#define ButtonsHeight 22.0
#define Space 12.0

#import "YYNavigationItem.h"

@interface YYNavigationItem ()
{
//    navigationController的栈中所有视图
    NSArray *_viewArrays;
    
//    左边按钮集合的X
    CGFloat _leftButtonsX;
    
//    右边按钮集合的X
    CGFloat _rightButtonsX;
    
//    分割线
    UIImageView *_separatorLine;
}
// 文本标题
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YYNavigationItem

#pragma mark 初始化方法
+ (instancetype)initWithViewArrays:(NSArray *)viewArrays {
    
    YYNavigationItem *navigationItem = [[YYNavigationItem alloc]initWithViewArrays:viewArrays];
    
    return navigationItem;
}

- (instancetype)initWithViewArrays:(NSArray *)viewArrays {
    
    self = [super init];
    
    if (self) {
        
        [self setFrame:CGRectMake(0, StatusBarHeight, View_Width, NavBarHeight)];
        
        _viewArrays = [NSArray arrayWithArray:viewArrays];
        
        _leftButtonsX = Space;
        
        _rightButtonsX = 0;
        
        if (_viewArrays.count > 1) {
            
            [self addSubview:self.backButton];
        }
        
        _separatorLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, NavBarHeight - 1, View_Width, 1)];
                
        [self addSubview:_separatorLine];
    }
    
    return self;
}

#pragma mark setter方法
- (void)setTitle:(NSString *)title {
    
    if (_titleView) {
        
        return;
    }
    
    self.titleLabel.text = title;
    
    [_titleLabel sizeToFit];
    
    _titleLabel.center = CGPointMake(self.centerX, self.height / 2);
}

- (void)setTitleView:(UIView *)titleView {
    
    _titleView = titleView;
    
    if (_titleLabel) {
        
        [_titleLabel removeFromSuperview];
        
        _titleLabel = nil;
    }
    
    if (_titleView.width == 0 || _titleView.height == 0) {
        
        [titleView setFrame:CGRectMake(0, 0, View_Width, NavBarHeight)];
    }
   
    if (_backButton) {
        
        float X = Space * 2 + _backButton.width;
        
        [titleView setFrame:CGRectMake(X, 0, View_Width - X, _titleView.height)];
    }
    
    [self addSubview:titleView];
}

- (void)setTextColor:(UIColor *)textColor {

    _textColor = textColor;

    if (!_textColor) {
        
        _textColor = [UIColor whiteColor];
    }
    
    _titleLabel.textColor = _textColor;
    
    if (_leftButtons.count > 0) {
        
        [_leftButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            [obj setTitleColor:_textColor forState:UIControlStateNormal];
        }];
    }
    
    if (_rightButtons.count > 0) {
        
        [_rightButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            [obj setTitleColor:_textColor forState:UIControlStateNormal];
        }];
    }
}

- (void)setLineColor:(UIColor *)lineColor {
    
    _separatorLine.image = nil;
    
    _separatorLine.backgroundColor = lineColor;
}

- (void)setLineImageName:(NSString *)lineImageName {
    
    _separatorLine.backgroundColor = nil;
    
    _separatorLine.image = [UIImage imageNamed:lineImageName];
}

- (void)setLeftButtons:(NSArray<UIButton *> *)leftButtons {
    
    if (_backButton) {
        
        [_backButton removeFromSuperview];
    }
    
    _leftButtons = leftButtons;
    
    [leftButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj setFrame:CGRectMake(_leftButtonsX, 0, obj.width, ButtonsHeight)];
        
        float tempX = obj.width + Space;
        
        _leftButtonsX = _leftButtonsX + tempX;

        if (_textColor) {
            
            [obj setTitleColor:_textColor forState:UIControlStateNormal];
        }else {
            
            [obj setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
        obj.centerY = self.height / 2;

        [self addSubview:obj];
    }];
}

- (void)setRightButtons:(NSArray<UIButton *> *)rightButtons {
    
    _rightButtons = rightButtons;
    
    [rightButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        float tempX = obj.width + Space;
        
        _rightButtonsX = _rightButtonsX + tempX;
        
        [obj setFrame:CGRectMake(View_Width - _rightButtonsX, 0, obj.width, ButtonsHeight)];
        
        if (_textColor) {
            
            [obj setTitleColor:_textColor forState:UIControlStateNormal];    
        }else {
            
            [obj setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
        obj.centerY = self.height / 2;
        
        [self addSubview:obj];
    }];
}

#pragma mark getter方法---初始化控件
- (UIButton *)backButton {
    
    if (!_backButton) {
        
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_backButton setFrame:CGRectMake(Space, 0, ButtonsHeight, ButtonsHeight)];
        
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        
        [_backButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        
        _backButton.centerY = self.height / 2;
    }
    
    return _backButton;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]init];
        
        if (!_textColor) {
            
            _textColor = [UIColor whiteColor];
        }
        
        _titleLabel.textColor = _textColor;
        
        _titleLabel.font = [UIFont systemFontOfSize:LabelFont];
        
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

#pragma mark 返回按钮的方法
- (void)pop {
    
    [[[_viewArrays lastObject] navigationController] popViewControllerAnimated:YES];
}

@end
