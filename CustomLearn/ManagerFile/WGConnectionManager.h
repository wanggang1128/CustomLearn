//
//  WGConnectionManager.h
//  CustomLearn
//
//  Created by wanggang on 2017/9/6.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGConnectionManager : NSObject

+ (WGConnectionManager *)shareWGConnectionManager;

//登录
- (void)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord deviceId:(NSString *)deviceId complete:(void(^)(WGRemoteResponse *remoteResponse))complete;

@end
