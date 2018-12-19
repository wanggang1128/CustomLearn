//
//  NSMutableArray+WGCommon.m
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import "NSMutableArray+WGCommon.h"

@implementation NSMutableArray (WGCommon)

#pragma 增加或删除对象

/**
 *  插入一个元素到指定位置
 *
 *  @param object 需要插入的元素
 *  @param index  位置
 */
- (void)insertObject:(id)object atIndexIfNotNil:(NSUInteger)index {
    if (self.count > index && object) {
        [self insertObject:object atIndex:index];
    }
}

/**
 *  移动对象 从一个位置到另一个位置
 *
 *  @param index   原位置
 *  @param toIndex 目标位置
 */
- (void)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    if (self.count > index && self.count > toIndex) {
        id object = [self objectAtIndex:index];
        if (index > toIndex) {
            [self removeObjectAtIndex:index];
            [self insertObject:object atIndex:toIndex];
        } else if (index < toIndex){
            [self removeObjectAtIndex:index];
            [self insertObject:object atIndex:toIndex - 1];
        }
    }
}

- (void)removeFirstObject {
    if (self.count > 0) {
        [self removeObjectAtIndex:0];
    }
}

#pragma mark - 排序

/**
 *  数组倒序
 *
 */
- (void)reverse {
    NSArray *reversedArray = [[self reverseObjectEnumerator] allObjects];
    [self removeAllObjects];
    [self addObjectsFromArray:reversedArray];
}

/**
 *  数组去除相同的元素
 */
- (void)unique {
    NSSet *set = [NSSet setWithArray:self];
    NSArray *array = [[NSArray alloc] initWithArray:[set allObjects]];
    [self removeAllObjects];
    [self addObjectsFromArray:array];}

/**
 *  根据关键词 对本数组的内容进行排序
 *
 *  @param parameters 关键词
 *  @param ascending  YES 升序 NO 降序
 *
 */
- (void)sorting:(NSString *)parameters ascending:(BOOL)ascending {
    NSSortDescriptor*sorter=[[NSSortDescriptor alloc]initWithKey:parameters ascending:ascending];
    NSMutableArray *sortDescriptors=[[NSMutableArray alloc]initWithObjects:&sorter count:1];
    NSArray *sortArray=[self sortedArrayUsingDescriptors:sortDescriptors];
    [self removeAllObjects];
    [self addObjectsFromArray:sortArray];
}

@end
