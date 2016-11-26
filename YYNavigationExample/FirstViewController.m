//
//  FirstViewController.m
//  YYNavigationBar
//
//  Created by yangyang on 16/7/29.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

#import "YYNavigation.h"

@interface FirstViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;

@property (nonatomic, copy) NSArray *textArray;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // 恢复原样
    self.naviBar.naviBgColor = [UIColor darkGrayColor];
    self.naviItem.textColor = [UIColor whiteColor];
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.naviItem.title = @"Demo";
    
    //    系统会自动调节ScrollView的Insets，在Push界面，POP时也都会，所以如果哪个界面，设置了系统导航栏为隐藏，那么就设置这个为NO，否则会出现很多奇奇怪怪的情况
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //    懒得写getter方法了。。。。
    self.textArray = [NSArray arrayWithObjects:@"Category类中属性的用法", @"是否隐藏自定义NavigationBar", @"设置NavigationBar的背景色", @"设置NavigationBar的透明度", @"设置NavigationBar不影响子视图显示的透明度", @"设置标题", @"自定义标题View", @"重写返回按钮", @"设置返回按钮是否隐藏", @"当前界面以及新生成界面的文本的颜色", @"分割线颜色", @"分割线图片", @"自定义左边按钮集合", @"自定义右边按钮集合", nil];
    
    // 设置view时需要从64算起(storyboard/xib同理)，主要是还没搞清楚系统的translucent原理，有知道的可以联系我^_^
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.textArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = self.textArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SecondViewController *sc = [SecondViewController new];
    sc.view.backgroundColor = [UIColor brownColor];
    [self.navigationController pushViewController:sc animated:YES];
    
    // 属性赋值需放在push后面
    sc.selectIndex = indexPath.row;
}

@end
