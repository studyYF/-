//
//  MyTabBarController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "MyTabBarController.h"
#import "EssenceViewController.h"
#import "FriendTrendViewController.h"
#import "NewViewController.h"
#import "PublishViewController.h"
#import "MeViewController.h"
#import "MyNavigationController.h"
#import "MyTabBar.h"


@interface MyTabBarController ()

@end

@implementation MyTabBarController
+ (void)load
{
    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTabBar];
}

//添加tabBar的子控制器
- (void)addTabBar
{
    EssenceViewController * essenceVC = [[EssenceViewController alloc] init];
    [self addChildViewControllerWithController:essenceVC title:@"精华" imageName:@"tabBar_essence_icon" seletcedImage:@"tabBar_essence_click_icon"];
    NewViewController * newVC = [[NewViewController alloc] init];
    [self addChildViewControllerWithController:newVC title:@"新帖" imageName:@"tabBar_new_icon" seletcedImage:@"tabBar_new_click_icon"];
    FriendTrendViewController * friendTrendVC = [[FriendTrendViewController alloc] init];
    [self addChildViewControllerWithController:friendTrendVC title:@"关注" imageName:@"tabBar_friendTrends_icon" seletcedImage:@"tabBar_friendTrends_click_icon"];
    MeViewController * meVC = [[MeViewController alloc] init];
    [self addChildViewControllerWithController:meVC title:@"我的" imageName:@"tabBar_me_icon" seletcedImage:@"tabBar_me_click_icon"];
    MyTabBar * tabBar = [[MyTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}

//设置tabBar的属性
- (void)addChildViewControllerWithController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName seletcedImage:(NSString *)seletecdImage{
    MyNavigationController * nav = [[MyNavigationController alloc] initWithRootViewController:controller];
    [nav.tabBarItem setTitle:title];
    [nav.tabBarItem setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nav.tabBarItem setSelectedImage:[[UIImage imageNamed:seletecdImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self addChildViewController:nav];
}




@end
