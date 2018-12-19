//
//  NSArray+WGCommon.m
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import "NSArray+WGCommon.h"

@implementation NSArray (WGCommon)

#pragma mark - 取值

/**
 *  获取数组的第一个元素
 *
 *  @return 取得的元素
 */
- (id)firstObject{
    if ([self count] > 0) {
        return [self objectAtIndex:0];
    }else {
        return nil;
    }
}

/**
 *  随机取数组里的一个元素
 *
 *  @return 随机取得的元素
 */
- (id)randomObject{
    if ([self count] > 0) {
        int index = arc4random() % [self count];
        id object = [self objectAtIndex:index];
        return object;
    } else {
        return nil;
    }
}

#pragma mark - 排序

/**
 *  数组倒序
 *
 *  @return 将数组倒序后得到的数组
 */
- (NSArray *)reversedArray {
    NSArray *reverseArray = [[self reverseObjectEnumerator] allObjects];
    return reverseArray;
}

/**
 *  数组去除相同的元素，并获得新的array
 *
 *  @return 去除相同元素后的array
 */
- (NSArray *)uniqueArray {
    NSSet *set = [NSSet setWithArray:self];
    NSArray *array = [NSArray arrayWithArray:[set allObjects]];
    return array;
}

/**
 *  根据关键词 对array的内容进行排序，并返回排序后的array
 *
 *  @param parameter 关键词
 *  @param ascending  YES 升序 NO 降序
 *
 *  @return 经过排序后的数组
 */
- (NSArray *)arraySorting:(NSString *)parameter  ascending:(BOOL)ascending {
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:parameter ascending:ascending];
    NSMutableArray *sortDescriptors = [[NSMutableArray alloc] initWithObjects:&sorter count:1];
    NSArray *sorterArr = [self sortedArrayUsingDescriptors:sortDescriptors];
    return sorterArr;
}

#pragma mark - 数组转成json 字符串
- (NSString *)transToJSONString{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
    
    
    
    
    
    
    









@end
