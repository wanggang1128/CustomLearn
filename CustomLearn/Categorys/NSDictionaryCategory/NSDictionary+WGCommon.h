//
//  NSDictionary+WGCommon.h
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (WGCommon)

#pragma mark - 合并
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict;

#pragma mark - 转成json字符串
-(NSString *)JSONString;

@end

NS_ASSUME_NONNULL_END
