//
//  FastLoginButton.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "FastLoginButton.h"

@implementation FastLoginButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.yf_y = 0;
    self.imageView.yf_centerX = self.yf_width * 0.5;
    self.titleLabel.yf_y = self.imageView.yf_height + 10;
    [self.titleLabel sizeToFit];
    self.titleLabel.yf_centerX = self.yf_width * 0.5;
}

@end
