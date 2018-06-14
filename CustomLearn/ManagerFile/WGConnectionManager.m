//
//  WGConnectionManager.m
//  CustomLearn
//
//  Created by wanggang on 2017/9/6.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGConnectionManager.h"

@implementation WGConnectionManager

#pragma mark 单例
static WGConnectionManager *instance = nil;
+ (WGConnectionManager *)shareWGConnectionManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WGConnectionManager alloc] init];
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
//登录
- (void)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord deviceId:(NSString *)deviceId complete:(void(^)(WGRemoteResponse *remoteResponse))complete{
    
    NSMutableDictionary *paragramDic = [[NSMutableDictionary alloc] init];
    [paragramDic setObject:userName forKey:@"mobile"];
//    [paragramDic setObject:passWord forKey:@"password"];
//    [paragramDic setObject:userName forKey:Transaction_UserName];
//    [paragramDic setObject:passWord forKey:Transaction_Password];
//    [paragramDic setObject:deviceId forKey:Transaction_DeviceId];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"gesture.png" ofType:nil];
//    UIImage *image = [UIImage imageNamed:@"gesture.png"];
//    NSData *data = UIImageJPEGRepresentation(image, 1.0);
//    [paragramDic setObject:data forKey:@"imageData"];
    
//    NSString *url = [NSString stringWithFormat:@"%@%@",TransactionUrl,login];
//    NSString *url = [NSString stringWithFormat:@"%@", @"http://172.16.150.144:8090/nursing-branch-web/auth/user/mobilelogin"];
     NSString *url = [NSString stringWithFormat:@"%@", @"http://172.16.150.144:8090/nursing-branch-web/app-api/auth/mobile/code"];
    
    [[WGSendGeneralRequest shareWGSendGeneralRequest] sendGeRequestWithURL:url paragram:paragramDic complete:^(WGRemoteResponse *remoteResponse) {
        complete(remoteResponse);
    }];
    
}

@end
