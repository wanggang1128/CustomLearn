//
//  NSString+ChineseCharacterCheck.m
//  CustomLearn
//
//  Created by wanggang on 2019/11/14.
//  Copyright © 2019 WG. All rights reserved.
//

#import "NSString+ChineseCharacterCheck.h"


@implementation NSString (ChineseCharacterCheck)

- (NSArray *)getChineseCharacter {
    
    if (self == nil || [self isEqual:@""]) {
        return nil;
    }
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i=0; i<self.length; i++) {
        int a = [self characterAtIndex:i];
        if (a < 0x9fff && a > 0x4e00) {
            [arr addObject:[self substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    return arr;
}

@end
