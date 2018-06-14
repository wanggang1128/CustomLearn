//
//  WGDownloadManager.h
//  CustomLearn
//
//  Created by wanggang on 2017/8/29.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DownloadSuccessBlock)(NSString *fileStorePath);
typedef void(^DownloadFaileBlock)(NSError *error);
typedef void(^DownloadProcessBlock)(float process);

@interface WGDownloadManager : NSObject<NSURLSessionDataDelegate>

@property (nonatomic,copy)DownloadSuccessBlock downloadSuccessBlock;
@property (nonatomic,copy)DownloadFaileBlock downloadFaileBlock;
@property (nonatomic,copy)DownloadProcessBlock downloadProcessBlock;

+ (WGDownloadManager *)shareWGDownloadManager;

- (void)downloadWithUrl:(NSString *)url
                success:(DownloadSuccessBlock)successBlock
                  faile:(DownloadFaileBlock)faileBlock
                process:(DownloadProcessBlock)processBlock;

- (void)stopTask;

@end
