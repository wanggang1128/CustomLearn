//
//  WGGlobleMethod.h
//  CustomLearn
//
//  Created by wanggang on 2017/9/6.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGGlobleMethod : NSObject

+ (WGGlobleMethod *)shareWGGlobleMethod;

//jsonstr转字典
- (NSDictionary *)jsonStrToDictionary:(NSString *)jsonStr;

//字典转jsonStr
- (NSString *)dictionaryToJsonStr:(NSDictionary *)dic;

//获取沙盒document路径
- (NSString *)applicationDocumentDirectoryFile:(NSString *)fileName;

@end
