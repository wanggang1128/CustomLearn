//
//  WGSendGeneralRequest.m
//  CustomLearn
//
//  Created by wanggang on 2017/9/6.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGSendGeneralRequest.h"

@interface WGSendGeneralRequest()<NSURLSessionDelegate,NSURLSessionTaskDelegate>

@end

@implementation WGSendGeneralRequest

#pragma mark 单例
static WGSendGeneralRequest *instance = nil;
+ (WGSendGeneralRequest *)shareWGSendGeneralRequest{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WGSendGeneralRequest alloc] init];
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

#pragma mark 发送普通Post交易
- (void)sendGeRequestWithURL:(NSString *)url paragram:(NSMutableDictionary *)parmDic complete:(void(^)(WGRemoteResponse *remoteResponse))complete{
    
//    [self baseParagram:parmDic];
    NSURL *requestUrl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:15.0];
    
    [self baseRequest:request paragram:parmDic];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            WGRemoteResponse *remoteResponse = [WGRemoteResponse remoteResponseWithDic:dataDic];
            complete(remoteResponse);
        }else{
            NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] init];
            [dataDic setObject:ReturnMsg_fail_default forKey:Transaction_ReturnMsg];
            [dataDic setObject:[NSString stringWithFormat:@"%ld",error.code] forKey:Transaction_ReturnCode];
            WGRemoteResponse *remoteResponse = [WGRemoteResponse remoteResponseWithDic:dataDic];
            complete(remoteResponse);
        }
    }];
    [task resume];
}

#pragma mark 添加公共参数
- (void)baseParagram:(NSMutableDictionary *)dic{
    if (dic) {
        if (![[dic allKeys] containsObject:Transaction_username]) {
            [dic setObject:@"SPDBA001017" forKey:Transaction_username];
        }
        if (![[dic allKeys] containsObject:Transaction_DeviceId]) {
            [dic setObject:@"SPDBA001017" forKey:Transaction_DeviceId];
        }
        if (![[dic allKeys] containsObject:Transaction_AppId]) {
            [dic setObject:@"TYPT" forKey:Transaction_AppId];
        }
    }
}

#pragma mark 设置请求头和请求体
- (void)baseRequest:(NSMutableURLRequest *)request paragram:(NSDictionary *)paragram{
    
    NSDictionary *headDic = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"application/json", @"Content-Type",
                             nil];
    NSData *data = [NSJSONSerialization dataWithJSONObject:paragram options:NSJSONWritingPrettyPrinted error:nil];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    [request setAllHTTPHeaderFields:headDic];
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    if (![challenge.protectionSpace.authenticationMethod isEqualToString:@"NSURLAuthenticationMethodServerTrust"]) return;
    /*
     NSURLSessionAuthChallengeUseCredential 使用证书
     NSURLSessionAuthChallengePerformDefaultHandling  忽略证书 默认的做法
     NSURLSessionAuthChallengeCancelAuthenticationChallenge 取消请求,忽略证书
     NSURLSessionAuthChallengeRejectProtectionSpace 拒绝,忽略证书
     */
    
    NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
    
    completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
}

@end
