//
//  MeFooterCell.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "MeFooterCell.h"

@interface MeFooterCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconview;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation MeFooterCell

- (void)awakeFromNib {
    self.iconview.layer.cornerRadius = self.iconview.yf_width * 0.5;
    self.iconview.layer.masksToBounds = YES;
}

- (void)setModel:(MeFooterModel *)model
{
    _model = model;
    [self.iconview sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    self.titleLabel.text = model.name;
}

@end
