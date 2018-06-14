//
//  WGJsonmodel.m
//  CustomLearn
//
//  Created by wanggang on 2018/2/23.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "WGJsonmodel.h"

@implementation Cat

//key映射
//+ (JSONKeyMapper *)keyMapper{
//    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"ID": @"id"}];
//}

//设置下划线自动转驼峰, 当服务端返回order_id类型字段是可以自动修改为orderId
+(JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}


//设置所有的属性为可选(所有属性值可以为空)
+ (BOOL)propertyIsOptional:(NSString*)propertyName{
    return YES;
}

@end

@implementation WGJsonmodel

@end
