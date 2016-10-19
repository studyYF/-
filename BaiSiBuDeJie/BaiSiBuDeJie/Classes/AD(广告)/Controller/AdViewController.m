//
//  AdViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/19.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "AdViewController.h"

@interface AdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
- (IBAction)jump:(id)sender;

@end

@implementation AdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLaunchImage];
}

#pragma mark -- 设置启动图片
- (void)setLaunchImage
{
    if (iPhone6P) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iPhone6) {
        self.launchImageView.image  = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    } else if (iPhone4) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage"];
    }
}


- (IBAction)jump:(id)sender {
}
@end
