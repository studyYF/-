//
//  SubTagCell.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/19.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "SubTagCell.h"

@interface SubTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIButton *bookButton;


@end


@implementation SubTagCell

- (void)awakeFromNib {
    self.iconImageView.layer.cornerRadius = 30;
    self.iconImageView.clipsToBounds = YES;
    [self.bookButton setBackgroundImage:[UIImage imageNamed:@"tagButtonBGClick"] forState:UIControlStateHighlighted];
}

- (void)setModel:(SubTagModel *)model
{
    _model = model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeLabel.text = model.theme_name;
    self.numLabel.text = [NSString stringWithFormat:@"%@人订阅",model.sub_number];
}

@end
