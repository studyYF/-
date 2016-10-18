//
//  MeViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "MeViewController.h"
#import "SettingViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
}

#pragma mark -- 设置导航栏
- (void)setNavigation
{
    //右侧
    UIBarButtonItem * settingItem = [UIBarButtonItem setNavigationItemWithNormalImage:[UIImage imageNamed:@"mine-setting-icon"] highlighted:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(settingAction)];
    UIBarButtonItem * nightStyleItem = [UIBarButtonItem setNavigationItemWithNormalImage:[UIImage imageNamed:@"mine-moon-icon"] seletcedImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(nightStyleAction:)];
    self.navigationItem.rightBarButtonItems = @[settingItem,nightStyleItem];
    //标题
    self.navigationItem.title = @"我的";
}

#pragma mark -- 按钮点击方法
- (void)settingAction
{
    SettingViewController * vc = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)nightStyleAction:(UIButton *)nightButton
{
    nightButton.selected = !nightButton.selected;
}

@end
