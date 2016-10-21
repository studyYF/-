//
//  EssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "EssenceViewController.h"
#import "EssenceTitleView.h"
#import "EssenceFactory.h"
#import "EssenceBaseViewController.h"

@interface EssenceViewController ()<EssenceTitleViewDelegate,UIScrollViewDelegate>
/**
 *  基本scrollView
 */
@property (nonatomic, strong) UIScrollView * baseScrollView;
/**
 *  子控制器数组
 */
@property (nonatomic, strong) NSMutableArray * vcArray;
/**
 *  按钮标题View
 */
@property (nonatomic, strong) EssenceTitleView * titleView;


@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self setNavigation];
    [self uiConfig];
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

#pragma mark -- 设置ui相关
- (void)uiConfig
{
    //设置scrollView不自动调整内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    //添加子控制器,添加子视图的View到scrollView上
    NSInteger i = 0;
    for (EssenceBaseViewController * controller in self.vcArray) {
        [self addChildViewController:controller];
        //设置view的坐标,(默认UITableViewController的view的y为20)
        controller.view.frame = CGRectMake(yfWidth * i, 0, yfWidth, yfHeight);
        [self.baseScrollView addSubview:controller.view];
        i ++;
    }
    //设置scrollView的contentSize
    self.baseScrollView.contentSize = CGSizeMake(self.vcArray.count * yfWidth, 0);
    
    //标题视图
    self.titleView = [[EssenceTitleView alloc] initWithFrame:CGRectMake(0, 64, yfWidth, 35)];
    self.titleView.delegate = self;
    [self.view addSubview:self.titleView];
}

#pragma mark -- 监听导航栏方法
- (void)gameAction
{
    YFLog(@"game");
}
- (void)randomAction{
    YFLog(@"random");
}

#pragma mark -- EssenceTitleViewDelegate
- (void)seletcedTitle:(NSInteger)index
{
    //调整当前scrollView的contentOffset
    [self.baseScrollView setContentOffset:CGPointMake(yfWidth * index, 0) animated:YES];
}

#pragma mark -- UIScrollViewDelegate
//滑动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / yfWidth;
    [self.titleView moveSeletcedButton:index];
}

#pragma mark -- 懒加载

- (UIScrollView *)baseScrollView
{
    if (!_baseScrollView) {
        _baseScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _baseScrollView.pagingEnabled = YES;
        _baseScrollView.showsHorizontalScrollIndicator = NO;
        _baseScrollView.showsVerticalScrollIndicator = NO;
        _baseScrollView.bounces = NO;
        _baseScrollView.delegate = self;
        _baseScrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_baseScrollView];
    }
    return _baseScrollView;
}

- (NSMutableArray *)vcArray{
    if (!_vcArray) {
        NSArray * titleArray =  @[@"全部",@"视频",@"声音",@"图片",@"段子"];
        _vcArray = [NSMutableArray arrayWithCapacity:5];
        for (NSString * titleStr in titleArray) {
            [_vcArray addObject:[EssenceFactory initBaseViewControllerWithTitle:titleStr]];
        }
    }
    return _vcArray;
}


@end
