//
//  UITextField+Placeholder.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)

//set方法,设置placeholder的颜色
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    UILabel * placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = placeholderColor;
}

//get方法,返回nil,用不到
- (UIColor *)placeholderColor
{
    return nil;
}

@end
