//
//  WGLianShiBlock.m
//  CustomLearn
//
//  Created by wanggang on 2018/6/13.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "WGLianShiBlock.h"

@implementation WGLianShiBlock

- (WGLianShiBlock*(^)(int num))add{
    return ^WGLianShiBlock* (int num){
        _result += num;
        return self;
    };
}

@end
