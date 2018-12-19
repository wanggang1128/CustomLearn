//
//  NSMutableArray+WGCommon.h
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (WGCommon)

#pragma 增加或删除对象
- (void)insertObject:(id)object atIndexIfNotNil:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;

#pragma mark - 排序
- (void)reverse;
- (void)unique;
- (void)sorting:(NSString *)parameters ascending:(BOOL)ascending;

@end

NS_ASSUME_NONNULL_END
