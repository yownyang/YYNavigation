//
//  YYNavigationItem.m
//  YYNavigationBar
//
//  Created by yangyang on 16/8/1.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "YYNavigationItem.h"

static NSString *const kTextColor = @"kTextColor";

@interface YYNavigationItem ()

@property (nonatomic) UIViewController *lastVC;

@property (nonatomic, assign) CGFloat leftButtonsX;
@property (nonatomic, assign) CGFloat rightButtonsX;

@property (nonatomic) UIImageView *separatorLine;
@property (nonatomic) UILabel *titleLabel;

@end

@implementation YYNavigationItem
@synthesize backButton = _backButton;

#pragma mark - InitMethod

+ (instancetype)naviItemWithStackCount:(CGFloat)stackCount lastViewController:(UIViewController *)lastViewController{
    
    YYNavigationItem *navigationItem = [[YYNavigationItem alloc] initWithStackCount:stackCount lastViewController:lastViewController];
    
    return navigationItem;
}

- (instancetype)initWithStackCount:(CGFloat)stackCount lastViewController:(UIViewController *)lastViewController{
    
    self = [super init];
    
    if (self) {
        
        self.frame = CGRectMake(0, YYStatusBarHeight, YYViewWidth, YYNaviBarHeight);
        
        [self addSubview:self.separatorLine];
        stackCount > 1 ? [self addSubview:self.backButton] : nil;
        
        self.leftButtonsX = YYSpace;
        self.rightButtonsX = 0;
        
        if ([self getTextColor]) {
            
            self.textColor = [self getTextColor];
        } else {
            
            self.textColor = [UIColor whiteColor];
        }
        
        self.lastVC = lastViewController;
    }
    
    return self;
}

#pragma mark - SetterMethod

- (void)setTitle:(NSString *)title {
    
    _title = title;
    
    if (self.titleView) {
        
        return;
    }
    
    self.titleLabel.text = title;
    
    [self.titleLabel sizeToFit];
    
    self.titleLabel.center = CGPointMake(self.centerX, self.height / 2);
}

- (void)setTitleView:(UIView *)titleView {
    
    if (_titleView.superview) {
        
        [_titleView removeFromSuperview];
        _titleView = nil;
    }
    
    _titleView = titleView;
        
    if (self.titleLabel) {
        
        [self.titleLabel removeFromSuperview];
        
        self.titleLabel = nil;
    }
    
    if (_titleView.width == 0 || _titleView.height == 0) {
        
        [titleView setFrame:CGRectMake(0, 0, self.width, self.height)];
    }
   
    if (self.backButton) {
        
        float X = YYSpace * 2 + self.backButton.width;
        
        [titleView setFrame:CGRectMake(X, 0, self.titleView.width - X, _titleView.height)];
    }
    
    [self addSubview:_titleView];
}

- (void)setTextColor:(UIColor *)textColor {
    
    if (self.titleView) {
        
        return;
    }
    
    [self saveTextColor:textColor];
    
    _textColor = textColor;
    
    self.titleLabel.textColor = textColor;
    
    if (self.leftButtons.count > 0) {
        
        [self.leftButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            [obj setTitleColor:textColor forState:UIControlStateNormal];
        }];
    }
    
    if (self.rightButtons.count > 0) {
        
        [self.rightButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            [obj setTitleColor:textColor forState:UIControlStateNormal];
        }];
    }
}

- (void)setLineColor:(UIColor *)lineColor {
    
    _lineColor = lineColor;
    
    self.separatorLine.image = nil;
    
    self.separatorLine.backgroundColor = lineColor;
}

- (void)setLineImageName:(NSString *)lineImageName {
    
    _lineImageName = lineImageName;
    
    self.separatorLine.backgroundColor = nil;
    
    self.separatorLine.image = [UIImage imageNamed:lineImageName];
}

- (void)setLeftButtons:(NSArray<UIButton *> *)leftButtons {
    
    if (self.backButton) {
        
        [self.backButton removeFromSuperview];
    }
    
    if (self.titleView) {
        
        [self.titleView removeFromSuperview];
    }
    
    _leftButtons = leftButtons;
    
    [_leftButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj setFrame:CGRectMake(self.leftButtonsX, 0, obj.width, obj.height)];
        
        float tempX = obj.width + YYSpace;
        
        self.leftButtonsX = self.leftButtonsX + tempX;

        [obj setTitleColor:self.textColor forState:UIControlStateNormal];
        
        obj.centerY = self.height / 2;

        [self addSubview:obj];
    }];
}

- (void)setRightButtons:(NSArray<UIButton *> *)rightButtons {
    
    if (self.titleView) {
        
        [self.titleView removeFromSuperview];
    }
    
    _rightButtons = rightButtons;
    
    [_rightButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        float tempX = obj.width + YYSpace;
        
        self.rightButtonsX = self.rightButtonsX + tempX;
        
        [obj setFrame:CGRectMake(YYViewWidth - self.rightButtonsX, 0, obj.width, obj.height)];
        
        [obj setTitleColor:self.textColor forState:UIControlStateNormal];
        
        obj.centerY = self.height / 2;
        
        [self addSubview:obj];
    }];
}

- (void)setBackButton:(UIButton *)backButton {
    
    [_backButton removeFromSuperview];
    
    _backButton = backButton;
    
    [self addSubview:_backButton];
    
    if (self.titleView) {
        
        float X = YYSpace * 2 + _backButton.width;
        
        [self.titleView setFrame:CGRectMake(X, 0, self.titleView.width - X, self.titleView.height)];
    } else {
        
        [self.titleView setFrame:CGRectMake(0, 0, self.titleView.width, self.titleView.height)];
    }
    
    [_backButton setFrame:CGRectMake(YYSpace, 0, _backButton.width, _backButton.height)];
    _backButton.centerY = self.height / 2;
}

- (void)setIsHiddenBackButton:(BOOL)isHiddenBackButton {
    
    _isHiddenBackButton = isHiddenBackButton;
    
    self.backButton.hidden = isHiddenBackButton;
    
    if (isHiddenBackButton) {
        
        [self.titleView setFrame:CGRectMake(0, 0, self.titleView.width, _titleView.height)];
    } else {
        
        float X = YYSpace * 2 + self.backButton.width;
        
        [self.titleView setFrame:CGRectMake(X, 0, self.titleView.width - X, _titleView.height)];
    }
}

#pragma mark - GetterMethod

- (UIImageView *)separatorLine {
    
    if (!_separatorLine) {
        
        _separatorLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.height - 1.0, self.width, 1.0)];
    }
    
    return _separatorLine;
}

- (UIButton *)backButton {
    
    if (!_backButton) {
        
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_backButton setFrame:CGRectMake(YYSpace, 0, YYButtonsHeight, YYButtonsHeight)];
        
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        
        [_backButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
        
        _backButton.centerY = self.height / 2;
    }

    return _backButton;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]init];
        
        _titleLabel.textColor = self.textColor;
        
        _titleLabel.font = [UIFont systemFontOfSize:YYLabelFont];
        
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

#pragma mark - BackAction

- (void)popViewController {
    
    [self.lastVC.navigationController popViewControllerAnimated:YES];
}

#pragma mark - NSUserDefaults

- (void)saveTextColor:(UIColor *)textColor {
    
    CGColorRef textColorRef = textColor.CGColor;
    NSString *textColorStr = [CIColor colorWithCGColor:textColorRef].stringRepresentation;
    
    [[NSUserDefaults standardUserDefaults] setObject:textColorStr forKey:kTextColor];
}

- (UIColor *)getTextColor {
    
    NSString *textColorStr = [[NSUserDefaults standardUserDefaults] objectForKey:kTextColor];
    
    CIColor *ciTextColor = [CIColor colorWithString:textColorStr];
    
    return [UIColor colorWithRed:ciTextColor.red green:ciTextColor.green blue:ciTextColor.blue alpha:ciTextColor.alpha];
}

@end
