//
//  WGLians.m
//  CustomLearn
//
//  Created by wanggang on 2019/8/21.
//  Copyright © 2019 WG. All rights reserved.
//

//typedef <#returnType#>(^<#name#>)(<#arguments#>);

#import "WGLians.h"

@interface WGLians()


@end

@implementation WGLians

-(WGLians *(^)(NSInteger num))add{
    return ^(NSInteger n){
        self.value += n;
        return self;
    };
}

@end
