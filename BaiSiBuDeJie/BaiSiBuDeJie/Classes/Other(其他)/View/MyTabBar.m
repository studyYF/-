//
//  MyTabBar.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/18.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "MyTabBar.h"

@interface MyTabBar()

@property (nonatomic, strong) UIButton * plusButton;

@end




@implementation MyTabBar

- (UIButton *)plusButton
{
    if (_plusButton == nil) {
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [_plusButton sizeToFit];
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //遍历tabbar的subviews,调整tabTab的位置
    CGFloat btnw = self.yf_width / (self.items.count + 1);
    CGFloat btnh = self.yf_height;
    NSInteger i = 0;
    for (UIView * view  in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            view.frame = CGRectMake(btnw * i, 0, btnw, btnh);
            i ++;
        }
    }
    self.plusButton.center = CGPointMake(self.yf_centerX, self.yf_height * 0.5);
}

@end
