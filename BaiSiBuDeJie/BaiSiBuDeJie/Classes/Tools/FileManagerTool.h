//
//  FileManagerTool.h
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/21.
//  Copyright © 2016年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManagerTool : NSObject
/**
 *  计算文件夹大小
 *
 *  @param directoryPath 文件夹路径
 *  @param completion    完成后的回调
 */
+ (void)caculateDirectoryWithPath:(NSString *)directoryPath completion:(void(^)(NSInteger fileSize))completion;
/**
 *  删除文件夹下所有文件
 *
 *  @param directoryPath 文件夹路径
 */
+ (void)removeDirectoryWithPath:(NSString *)directoryPath completion:(void(^)(BOOL isCompletion))completion;

@end
