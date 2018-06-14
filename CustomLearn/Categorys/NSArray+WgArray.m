//
//  NSArray+WgArray.m
//  CustomLearn
//
//  Created by wanggang on 2018/4/20.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "NSArray+WgArray.h"
#import <objc/message.h>

@implementation NSArray (WgArray)

+(void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method old = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
        Method new = class_getInstanceMethod(self, @selector(WG_objectAtIndex_NSArrayI:));
        if (old && new) {
            method_exchangeImplementations(old, new);
        }
        
        old = class_getInstanceMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(objectAtIndex:));
        new = class_getInstanceMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(WG_objectAtIndex_NSSingleObjectArrayI:));
        if (old && new) {
            method_exchangeImplementations(old, new);
        }
        
        old = class_getInstanceMethod(objc_getClass("__NSArray0"), @selector(objectAtIndex:));
        new = class_getInstanceMethod(objc_getClass("__NSArray0"), @selector(WG_objectAtIndex_NSArray0:));
        if (old && new) {
            method_exchangeImplementations(old, new);
        }
        
    });
}

- (id)WG_objectAtIndex_NSArrayI:(NSUInteger)index {
    if (index > self.count - 1 || !self.count) {
        @try {
            return [self WG_objectAtIndex_NSArrayI:index];
        } @catch (NSException *exception) {
            NSLog(@"不可数组多元素越界了");
            return nil;
        } @finally {
        }
    } else {
        return [self WG_objectAtIndex_NSArrayI:index];
    }
}

- (id)WG_objectAtIndex_NSSingleObjectArrayI:(NSUInteger)index {
    if (index > self.count - 1 || !self.count) {
        @try {
            return [self WG_objectAtIndex_NSSingleObjectArrayI:index];
        } @catch (NSException *exception) {
            NSLog(@"不可数组一个元素越界了");
            return nil;
        } @finally {
        }
    } else {
        return [self WG_objectAtIndex_NSSingleObjectArrayI:index];
    }
}

- (id)WG_objectAtIndex_NSArray0:(NSUInteger)index {
    if (index > self.count - 1 || !self.count) {
        @try {
            return [self WG_objectAtIndex_NSArray0:index];
        } @catch (NSException *exception) {
            NSLog(@"不可数组0个元素越界了");
            return nil;
        } @finally {
        }
    } else {
        return [self WG_objectAtIndex_NSArray0:index];
    }
}

@end
