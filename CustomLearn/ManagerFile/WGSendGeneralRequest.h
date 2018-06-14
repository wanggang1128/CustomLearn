//
//  WGSendGeneralRequest.h
//  CustomLearn
//
//  Created by wanggang on 2017/9/6.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WGRemoteResponse.h"


@interface WGSendGeneralRequest : NSObject

+ (WGSendGeneralRequest *)shareWGSendGeneralRequest;

- (void)sendGeRequestWithURL:(NSString *)url paragram:(NSMutableDictionary *)parmDic complete:(void(^)(WGRemoteResponse *remoteResponse))complete;

@end
