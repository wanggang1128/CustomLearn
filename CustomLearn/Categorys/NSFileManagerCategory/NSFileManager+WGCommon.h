//
//  NSFileManager+WGCommon.h
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (WGCommon)

#pragma mark - 各种路径及URL
+ (NSURL *)documentsURL;
+ (NSString *)documentsPath;
+ (NSURL *)libraryURL;
+ (NSString *)libraryPath;
+ (NSURL *)cachesURL;
+ (NSString *)cachesPath;
+ (NSString *)homePath;
+ (NSString *)tmpPath;

#pragma 各种方法
- (BOOL)isFileExists:(NSString *)filePath;
- (BOOL)isFile:(NSString *)filePath timeout:(NSTimeInterval)timeout;

@end

NS_ASSUME_NONNULL_END
