//
//  WGHanShuShiBlock.m
//  CustomLearn
//
//  Created by wanggang on 2018/12/4.
//  Copyright © 2018 WG. All rights reserved.
//

#import "WGHanShuShiBlock.h"

@implementation WGHanShuShiBlock

- (WGHanShuShiBlock *)caculator:(int(^)(int))block{
    _result = block(_result);
    return self;
}

@end
