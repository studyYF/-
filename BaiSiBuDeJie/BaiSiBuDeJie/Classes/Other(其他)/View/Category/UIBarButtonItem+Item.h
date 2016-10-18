//
//  UIBarButtonItem+Item.h
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (UIBarButtonItem *)setNavigationItemWithNormalImage:(UIImage *)normalImage highlighted:(UIImage *)highlightedImage target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)setNavigationItemWithNormalImage:(UIImage *)normalImage seletcedImage:(UIImage *)seletcedImage target:(id)target action:(SEL)action;


@end
