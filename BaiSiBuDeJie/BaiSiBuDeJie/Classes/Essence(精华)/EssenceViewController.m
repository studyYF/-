//
//  EssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "EssenceViewController.h"

@interface EssenceViewController ()

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
}
#pragma mark -- 设置导航栏
- (void)setNavigation
{
    //左侧
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setNavigationItemWithNormalImage:[UIImage imageNamed:@"nav_item_game_icon"] highlighted:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(gameAction)];
    //右侧
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem setNavigationItemWithNormalImage:[UIImage imageNamed:@"navigationButtonRandom"] highlighted:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(randomAction)];
    //标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

#pragma mark -- 监听导航栏方法
- (void)gameAction
{
    YFLog(@"game");
}
- (void)randomAction{
    YFLog(@"random");
}
@end
