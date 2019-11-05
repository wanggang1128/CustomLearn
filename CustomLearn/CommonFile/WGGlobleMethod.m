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


+ (UIColor *)uiColorFromString:(NSString *)clrString {
    if ([clrString length] == 0) {
        return [UIColor clearColor];
    }
    
    if ( [clrString rangeOfString:@"#"].location != 0 )
    {
        // error
        return [UIColor redColor];
    }
    
    if ([clrString length] == 7)
    {
        clrString = [clrString stringByAppendingString:@"FF"];
    }
    
    if ([clrString length] != 9)
    {
        // error
        return [UIColor redColor];
    }
    
    const char * strBuf= [clrString UTF8String];
    
    unsigned long iColor = strtoul((strBuf+1), NULL, 16);
    typedef struct colorByte
    {
        unsigned char a;
        unsigned char b;
        unsigned char g;
        unsigned char r;
    }CLRBYTE;
    
    CLRBYTE  pclr ;
    memcpy(&pclr, &iColor, sizeof(CLRBYTE));
    
    return [UIColor colorWithRed:(pclr.r/255.0)
                           green:(pclr.g/255.0)
                            blue:(pclr.b/255.0)
                           alpha:(pclr.a/255.0)];
}

@end
