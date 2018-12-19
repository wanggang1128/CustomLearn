//
//  NSArray+WGCommon.h
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (WGCommon)

#pragma mark - 取值
- (id)firstObject;
- (id)randomObject;

#pragma mark - 排序
- (NSArray *)reversedArray;
- (NSArray *)uniqueArray;
- (NSArray *)arraySorting:(NSString *)parameters  ascending:(BOOL)ascending;

#pragma mark - 数组转成json 字符串
- (NSString *)transToJSONString;

@end

NS_ASSUME_NONNULL_END
