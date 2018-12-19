//
//  NSMutableString+WGCommon.h
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableString (WGCommon)

- (void)replaceString:(NSString *)searchString withString:(NSString *)newString;
- (void)removeSpace;
- (void)removeNilAndNull;

//由于系统计算富文本的高度不正确，自己写了方法
- (CGFloat)heightWithContainWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
