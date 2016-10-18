//
//  UIBarButtonItem+Item.h
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
/**
 *  创建导航栏按钮(高亮)
 */
+ (UIBarButtonItem *)setNavigationItemWithNormalImage:(UIImage *)normalImage highlighted:(UIImage *)highlightedImage target:(id)target action:(SEL)action;
/**
 *  创建导航栏返回按钮
 */
+ (UIBarButtonItem *)setBackNavigationItemWithTarget:(id)target action:(SEL)action;
/**
 *  创建导航栏(选中)
 */
+ (UIBarButtonItem *)setNavigationItemWithNormalImage:(UIImage *)normalImage seletcedImage:(UIImage *)seletcedImage target:(id)target action:(SEL)action;


@end
