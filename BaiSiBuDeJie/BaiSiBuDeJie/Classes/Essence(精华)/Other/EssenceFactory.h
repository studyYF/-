//
//  EssenceFactory.h
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/21.
//  Copyright © 2016年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EssenceBaseViewController.h"

@interface EssenceFactory : NSObject

+ (EssenceBaseViewController *)initBaseViewControllerWithTitle:(NSString *)title;

@end
