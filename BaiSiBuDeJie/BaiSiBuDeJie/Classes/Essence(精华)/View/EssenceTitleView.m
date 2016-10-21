//
//  EssenceTitleView.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/21.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "EssenceTitleView.h"

@interface EssenceTitleView ()
/**
 *  上次选中的按钮
 */
@property (nonatomic, strong) UIButton * lastSeletcedButton;
/**
 *  滑动条View
 */
@property (nonatomic, strong) UIView * lineView;



@end

@implementation EssenceTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        [self configButton];
        [self configLineView];
    }
    return self;
}

//创建下划线
- (void)configLineView
{
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.yf_height - 2, 0, 2)];
    self.lineView.backgroundColor = [UIColor redColor];
    [self addSubview:self.lineView];
    UIButton * firstButton = self.subviews[0];
    firstButton.selected = YES;
    self.lastSeletcedButton = firstButton;
    //让第一个button计算里面label的尺寸,不然获取到的label的宽度是0
    [firstButton.titleLabel sizeToFit];
    self.lineView.yf_width = firstButton.titleLabel.yf_width + 10;
    self.lineView.yf_centerX = firstButton.yf_centerX;
    
}

//创建标题按钮
- (void)configButton
{
    NSArray * titleArray = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat btnW = yfWidth / titleArray.count;
    for (int i = 0; i < titleArray.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(btnW * i, 0, btnW, self.yf_height);
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.tag = 300 + i;
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonSeletced:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:button];
    }
}

- (void)buttonSeletced:(UIButton *)button
{
    self.lastSeletcedButton.selected = NO;
    button.selected = !button.selected;
    self.lastSeletcedButton = button;
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.yf_width = button.titleLabel.yf_width + 10;
        self.lineView.yf_centerX = button.yf_centerX;
    }];
    if ([self.delegate respondsToSelector:@selector(seletcedTitle:)]) {
        [self.delegate seletcedTitle:button.tag - 300];
    }
}

- (void)moveSeletcedButton:(NSInteger)index
{
    [self buttonSeletced:self.subviews[index]];
}


@end
