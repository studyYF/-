//
//  MeViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "MeViewController.h"
#import "SettingViewController.h"
#import "MeFooterModel.h"
#import "MeFooterCell.h"
#import "WebViewController.h"


static NSInteger const itemCount = 4;
static CGFloat const margin = 1;
#define  itemWH  (yfWidth - (itemCount - 1)) / itemCount

@interface MeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;

@property (nonatomic, strong) NSMutableArray * dataArray;



@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self uiConfig];
    [self prepareData];
}

- (void)uiConfig
{
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-34, 0, 0, 0);
}

- (void)prepareData
{
    [[HTTPRequestTool defaultManager] loadMeFooterData:^(id result, NSError *error) {
        if (error == nil) {
            self.dataArray = [MeFooterModel mj_objectArrayWithKeyValuesArray:result[@"square_list"]];
            //计算collectionView的contentSize
            [self caculateSize];
            //添加空数据,让每行最后位置也添加空白
            [self addEmptyData];
            [self.collectionView reloadData];
            //重新设置一下footerView,让tableView自动计算contentSize
            self.tableView.tableFooterView = self.collectionView;
        } else {
            
        }
    }];
}

#pragma mark -- 计算collectionView高度
- (void)caculateSize
{
    NSInteger rows = (self.dataArray.count - 1) / itemCount + 1;
    self.collectionView.yf_height = itemWH * rows;
}

#pragma mark -- 添加空数据
- (void)addEmptyData
{
    NSInteger leftCount = self.dataArray.count % itemCount;
    if (leftCount != 0) {
        for (int i = 0; i < leftCount; i ++) {
            MeFooterModel * model = [[MeFooterModel alloc] init];
            [self.dataArray addObject:model];
        }
    }
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

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //跳转到WKWebView
    MeFooterModel * model = self.dataArray[indexPath.item];
    if (![model.url containsString:@"http"]) return;
    WebViewController * vc = [[WebViewController alloc] init];
    vc.url = [NSURL URLWithString:model.url];
    vc.titleStr = model.name;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MeFooterCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MeFooterCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.item];
    return cell;
}

#pragma mark -- 懒加载
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        //计算layout
        layout.itemSize = CGSizeMake(itemWH, itemWH);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumInteritemSpacing = margin;
        layout.minimumLineSpacing = margin;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"MeFooterCell" bundle:nil] forCellWithReuseIdentifier:@"MeFooterCell"];
        _collectionView.backgroundColor = self.tableView.backgroundColor;
        self.tableView.tableFooterView = _collectionView;
        _collectionView.scrollEnabled = NO;
    }
    return _collectionView;
}


- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


@end
