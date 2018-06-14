//
//  WGRemoteResponse.h
//  CustomLearn
//
//  Created by wanggang on 2017/9/6.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGRemoteResponse : NSObject

+ (instancetype)remoteResponseWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

- (BOOL)isSuccess;
- (NSString *)returnCode;
- (NSString *)returnMsg;
- (NSDictionary *)responseDic;

@end
