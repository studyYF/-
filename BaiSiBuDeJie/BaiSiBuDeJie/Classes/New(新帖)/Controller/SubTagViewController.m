//
//  SubTagViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/19.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "SubTagViewController.h"
#import "SubTagModel.h"
#import "SubTagCell.h"


@interface SubTagViewController ()

@property (nonatomic, strong) NSMutableArray * dataArray;


@end

@implementation SubTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiConfig];
    [self prepareData];
    
}

- (void)uiConfig
{
    self.title = @"推荐标签";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.81f green:0.81f blue:0.81f alpha:1.00f];
    [self.tableView registerNib:[UINib nibWithNibName:@"SubTagCell" bundle:nil] forCellReuseIdentifier:@"SubTagCell"];
}


- (void)prepareData {
    [[HTTPRequestTool defaultManager] loadSubTag:^(id result, NSError *error) {
        if (error == nil) {
            YFLog(@"%@",result);
            self.dataArray = [SubTagModel mj_objectArrayWithKeyValuesArray:result];
            [self.tableView reloadData];
        }
        else {
            YFLog(@"%@",error);
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubTagCell" forIndexPath:indexPath];
     cell.model = self.dataArray[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


#pragma mark -- 懒加载
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


@end
