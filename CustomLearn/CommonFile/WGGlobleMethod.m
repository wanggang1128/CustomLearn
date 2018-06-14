//
//  WGGlobleMethod.m
//  CustomLearn
//
//  Created by wanggang on 2017/9/6.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGGlobleMethod.h"

@implementation WGGlobleMethod

#pragma mark 单例
static WGGlobleMethod *instance = nil;
+ (WGGlobleMethod *)shareWGGlobleMethod{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WGGlobleMethod alloc] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

- (id)copyWithZone:(NSZone *)zone{
    return instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return instance;
}

#pragma mark 方法
//jsonstr转字典
- (NSDictionary *)jsonStrToDictionary:(NSString *)jsonStr{
    if (jsonStr && jsonStr.length > 0) {
        NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            NSLog(@"json解析失败：%@",error);
            return nil;
        }
        return dic;
    }
    return nil;
}

//字典转jsonStr
- (NSString *)dictionaryToJsonStr:(NSDictionary *)dic{
    if (dic) {
        NSError *error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return jsonStr;
    }
    return @"";
}

//获取沙盒document路径
- (NSString *)applicationDocumentDirectoryFile:(NSString *)fileName{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    if (fileName && fileName.length > 0) {
        NSString *documentDirectory = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
        return documentDirectory;
    }
    return path;
}

@end
