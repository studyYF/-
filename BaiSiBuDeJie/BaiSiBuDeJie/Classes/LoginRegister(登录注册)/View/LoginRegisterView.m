//
//  LoginRegisterView.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "LoginRegisterView.h"

@implementation LoginRegisterView

 + (instancetype)loadLoginView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LoginRegisterView class]) owner:self options:nil] firstObject];
}

+ (instancetype)loadRegisterView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LoginRegisterView class]) owner:self options:nil] lastObject];
}

@end
