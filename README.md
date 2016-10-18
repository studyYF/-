# 
仿写百思不得姐

1.自定义tabbar,调整tabbar位置,添加发布按钮到tabbar
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
    //设置中间发布按钮的位置
    self.plusButton.center = CGPointMake(self.yf_centerX, self.yf_height * 0.5);
}

利用kvc设置tabbar
MyTabBar * tabBar = [[MyTabBar alloc] init];
[self setValue:tabBar forKey:@"tabBar"];