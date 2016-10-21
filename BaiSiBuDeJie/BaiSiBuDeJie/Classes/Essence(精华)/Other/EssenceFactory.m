//
//  EssenceFactory.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/21.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "EssenceFactory.h"
#import "EssenceAllViewController.h"
#import "EssenceVideoViewController.h"
#import "EssenceVoiceViewController.h"
#import "EssencePictureViewController.h"
#import "EssenceWordViewController.h"


@implementation EssenceFactory

+ (EssenceBaseViewController *)initBaseViewControllerWithTitle:(NSString *)title
{
    EssenceBaseViewController * vc;
    if ([title isEqualToString:@"全部"]) {
        vc = [[EssenceAllViewController alloc] init];
    } else if ([title isEqualToString:@"视频"]) {
        vc = [[EssenceVideoViewController alloc] init];
     } else if ([title isEqualToString:@"声音"]) {
        vc = [[EssenceVoiceViewController alloc] init];
    } else if ([title isEqualToString:@"图片"]) {
        vc = [[EssencePictureViewController alloc] init];
    } else {
        vc = [[EssenceWordViewController alloc] init];
    }
    return vc;
}

@end
