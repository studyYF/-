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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.iconImageView.layer.cornerRadius = 30;
    self.iconImageView.clipsToBounds = YES;
    [self.bookButton setBackgroundImage:[UIImage imageNamed:@"tagButtonBGClick"] forState:UIControlStateHighlighted];
}
#pragma mark -- 重写setFrame方法,调整cell的位置,添加分割线,此时需要把tableView的背景颜色设置成分割线的颜色
- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    [super setFrame:frame];
}

- (void)setModel:(SubTagModel *)model
{
    _model = model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeLabel.text = model.theme_name;
    self.numLabel.text = [NSString stringWithFormat:@"%@人订阅",model.sub_number];
}

@end
