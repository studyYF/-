//
//  SubTagModel.h
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/19.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "BaseModel.h"

@interface SubTagModel : BaseModel

/**
 *  标签名字
 */
@property (nonatomic, copy) NSString* theme_name;
/**
 *  图片地址
 */
@property (nonatomic, copy) NSString* image_list;
/**
 *  订阅人数
 */
@property (nonatomic, copy) NSString* sub_number ;

 
@end
