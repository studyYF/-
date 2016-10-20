//
//  FastLoginView.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "FastLoginView.h"

@implementation FastLoginView

+ (instancetype)fastLoginView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FastLoginView class]) owner:self options:nil] firstObject];
}

@end
