//
//  UITextField+Placeholder.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "UITextField+Placeholder.h"
#import <objc/message.h>

@implementation UITextField (Placeholder)

/**
 *  这里的设置placeholder方法,当先设置颜色,后设置占位文字的时候就不会有效果,所以要用runtime方法,保存placeholderColor属性的值,当设置占位文字的时候,再赋值给placeholderLabel
 */


+ (void)load
{
    //获取两个方法
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
    Method setYFPlaceholderMethod = class_getInstanceMethod(self, @selector(setYFPlaceholder:));
    //交换两个方法
    method_exchangeImplementations(setPlaceholderMethod, setYFPlaceholderMethod);
}

//set方法,设置placeholder的颜色
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    //保存placeholderColor属性,
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UILabel * placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = placeholderColor;
}

//get方法,返回nil,用不到
- (UIColor *)placeholderColor
{
    //取出保存的placeholderColor属性
    return objc_getAssociatedObject(self, @"placeholderColor");
}

//构造一个方法,在设置placeholder的时候,把placeholderColor赋值(分类中不能重写父类的setPlaceholder方法,因为分类的优先级更高,此时需要交换方法)
- (void)setYFPlaceholder:(NSString *)placeholder
{
    //调用自己就相当于调用setPlaceholder,因为交换了方法
    [self setYFPlaceholder:placeholder];
    self.placeholderColor = self.placeholderColor;
}

@end
