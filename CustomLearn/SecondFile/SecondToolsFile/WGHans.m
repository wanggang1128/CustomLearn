//
//  WGHans.m
//  CustomLearn
//
//  Created by wanggang on 2019/8/21.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGHans.h"

@implementation WGHans

- (WGHans *)add:(NSInteger(^)(NSInteger num))block{
    self.value = block(self.value);
    return self;
}

@end
