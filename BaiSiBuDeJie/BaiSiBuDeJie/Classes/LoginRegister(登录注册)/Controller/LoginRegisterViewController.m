//
//  LoginRegisterViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "LoginRegisterViewController.h"
#import "LoginRegisterView.h"
#import "FastLoginView.h"

@interface LoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet UIView *loginRegisterView;
@property (weak, nonatomic) IBOutlet UIView *fastLoginView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewConstrantsX;

@end

@implementation LoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiConfig];
}

- (void)uiConfig
{
    //加载登录view
    [self.loginRegisterView addSubview:[LoginRegisterView loadLoginView]];
    //加载注册view
    [self.loginRegisterView addSubview:[LoginRegisterView loadRegisterView]];
    //加载快速登录View
    [self.fastLoginView addSubview:[FastLoginView fastLoginView]];
}

#pragma mark -- 控件方法
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil]; 
}

- (IBAction)registerAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.loginViewConstrantsX.constant = sender.selected ? - yfWidth : 0;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}


#pragma mark -- 设置控件的frame,不要在viewDidLoad方法中设置
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    //这里设置从xib加载的控件的frame,这样就不会出现尺寸的问题
    LoginRegisterView * loginView  = self.loginRegisterView.subviews[0];
    loginView.frame = CGRectMake(0, 0, yfWidth, self.loginRegisterView.yf_height);
    LoginRegisterView * registerView = self.loginRegisterView.subviews[1];
    registerView.frame = CGRectMake(yfWidth, 0, yfWidth, self.loginRegisterView.yf_height);
    FastLoginView * fastLoginView = self.fastLoginView.subviews[0];
    fastLoginView.frame = CGRectMake(0, 0, yfWidth, self.fastLoginView.yf_height);
    
}

@end
