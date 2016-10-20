//
//  LoginTextField.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "LoginTextField.h"

@implementation LoginTextField

- (void)awakeFromNib
{
    //设置光标颜色
    self.tintColor = [UIColor whiteColor];
    self.placeholderColor = [UIColor lightGrayColor];
    
    //监听text状态改变
    //编辑开始
    [self addTarget:self action:@selector(editBegin) forControlEvents:UIControlEventEditingDidBegin];
    //编辑结束
    [self addTarget:self action:@selector(editEnd) forControlEvents:UIControlEventEditingDidEnd];
}


- (void)editBegin
{
    self.placeholderColor = [UIColor whiteColor];
}


- (void)editEnd
{
    self.placeholderColor = [UIColor lightGrayColor];
}



@end
