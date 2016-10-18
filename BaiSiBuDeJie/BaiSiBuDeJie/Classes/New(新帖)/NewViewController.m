//
//  NewViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
}

#pragma mark -- 设置导航栏
- (void)setNavigation
{
    //左侧
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setNavigationItemWithNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] highlighted:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(subIconAction)];
    //标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

#pragma mark -- 按钮点击方法
- (void)subIconAction
{
    YFLog(@"subIcon");
}
@end
