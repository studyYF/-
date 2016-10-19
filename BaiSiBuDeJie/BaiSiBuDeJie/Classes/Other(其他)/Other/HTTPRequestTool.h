//
//  HTTPRequestTool.h
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/19.
//  Copyright © 2016年 YF. All rights reserved.
//
typedef NS_ENUM(NSUInteger,RequestType){
    HTTPMethodGET,
    HTTPMethodPOST,
};
/**
 *  网络请求结果回调block
 */
typedef void (^CompletionBlock)(id result, NSError * error);

#import <Foundation/Foundation.h>


@interface HTTPRequestTool : AFHTTPSessionManager

@property (nonatomic, copy) void(^complete)(id result,NSError * error);



+ (instancetype)defaultManager;

/**
 *  网络请求
 */
- (void)requestWithMethod:(RequestType)type param:(NSDictionary *)param urlString:(NSString *)urlString completion:(CompletionBlock)completion;

/**
 *  加载推荐订阅
 */
- (void)loadSubTag:(CompletionBlock)completion;

@end
