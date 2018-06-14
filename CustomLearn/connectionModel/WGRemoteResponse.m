//
//  WGRemoteResponse.m
//  CustomLearn
//
//  Created by wanggang on 2017/9/6.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGRemoteResponse.h"

@interface WGRemoteResponse()
{
    NSString *returnCode;
    NSString *returnMsg;
    NSDictionary *responseDic;
}
@end

@implementation WGRemoteResponse

+ (instancetype)remoteResponseWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        returnCode = [dic valueForKey:Transaction_ReturnCode];
        returnMsg = [dic valueForKey:Transaction_ReturnMsg];
        responseDic = dic;
    }
    return self;
}

- (BOOL)isSuccess{
    return [Return_Success isEqualToString:returnCode];
}
- (NSString *)returnCode{
    return returnCode;
}
- (NSString *)returnMsg{
    return returnMsg;
}
- (NSDictionary *)responseDic{
    return responseDic;
}

@end
