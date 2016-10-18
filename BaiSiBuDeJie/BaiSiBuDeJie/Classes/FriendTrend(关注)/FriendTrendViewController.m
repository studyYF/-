//
//  FriendTrendViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "FriendTrendViewController.h"

@interface FriendTrendViewController ()

@end

@implementation FriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
}

#pragma mark -- 设置导航栏
- (void)setNavigation
{
    //左侧
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setNavigationItemWithNormalImage:[UIImage imageNamed:@"friendsRecommentIcon"] highlighted:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecommentAction)];
    //标题
    self.navigationItem.title = @"我的关注";
}

#pragma mark -- 按钮点击方法
- (void)friendsRecommentAction
{
    YFLog(@"friendsRecommentAction");
}

@end
