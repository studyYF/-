//
//  HTTPRequestTool.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/19.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "HTTPRequestTool.h"

@implementation HTTPRequestTool
//单例
+ (instancetype)defaultManager
{
    static HTTPRequestTool * tool = nil;
    static dispatch_once_t onceToken;
    if (!tool) {
        dispatch_once(&onceToken, ^{
            tool = [[HTTPRequestTool alloc] init];
        });
    }
    return tool;
}
//网络请求基本方法
- (void)requestWithMethod:(RequestType)type param:(NSDictionary *)param urlString:(NSString *)urlString completion:(CompletionBlock)completion
{
    //如果是GET请求
    if (type == HTTPMethodGET) {
        [self GET:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completion(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil,error);
        }];
    }
    else {
        [self POST:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completion(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil,error);
        }];
    }
}

/**
 *  加载推荐订阅
 */
- (void)loadSubTag:(CompletionBlock)completion
{
    NSMutableDictionary * param = [NSMutableDictionary dictionary];
    param[@"a"] = @"tag_recommend";
    param[@"action"] = @"sub";
    param[@"c"] = @"topic";
    [self requestWithMethod:HTTPMethodGET param:param urlString:subTagURL completion:^(id result, NSError *error) {
        if (error == nil) {
            completion(result,nil);
        }
        else {
            completion(nil,error);
        }
    }];
}


@end
