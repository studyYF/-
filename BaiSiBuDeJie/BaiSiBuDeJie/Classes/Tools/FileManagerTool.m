//
//  FileManagerTool.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/21.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "FileManagerTool.h"

@implementation FileManagerTool

+ (void)caculateDirectoryWithPath:(NSString *)directoryPath completion:(void (^)(NSInteger))completion
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    //开启异步计算大小
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //获取该文件夹下所有文件夹子路径
        NSArray * subPaths = [fileManager subpathsOfDirectoryAtPath:directoryPath error:nil];
        NSInteger totalSize = 0;
        for (NSString * path in subPaths) {
            //拼接子路径
            NSString * filepath = [directoryPath stringByAppendingPathComponent:path];
            BOOL isDirectory;
            //判断文件是否存在,是否是文件夹,如果是文件夹则跳过本次循环,因为该方法不能计算文件夹大小,只能计算文件大小
            BOOL isExist = [fileManager fileExistsAtPath:filepath isDirectory:&isDirectory];
            if (!isDirectory || !isExist) {
                continue;
            }
            //获取文件属性
            NSDictionary * atts = [fileManager attributesOfItemAtPath:filepath error:nil];
            //计算大小
            NSInteger size = [atts fileSize];
            totalSize += size;
        }
        //回到主线程,回调文件夹大小,(因为在回调中需要刷新界面)
        dispatch_sync(dispatch_get_main_queue(), ^{
            completion(totalSize);
        });
    });
}

+ (void)removeDirectoryWithPath:(NSString *)directoryPath completion:(void (^)(BOOL))completion
{
    //开启异步线程,删除文件夹
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //获取文件夹下的所有文件,不包括子路径下的子路径
        NSArray * subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
        for (NSString * path in subpaths) {
            //拼接路径
            NSString * filepath = [directoryPath stringByAppendingPathComponent:path];
            //删除文件
            [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
        }
        //回到主线程回调
        dispatch_sync(dispatch_get_main_queue(), ^{
            completion(YES);
        });
    });
}

@end
