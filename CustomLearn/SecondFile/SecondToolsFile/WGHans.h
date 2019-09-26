//
//  WGHans.h
//  CustomLearn
//
//  Created by wanggang on 2019/8/21.
//  Copyright © 2019 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGHans : NSObject

@property (nonatomic, assign) NSInteger value;

- (WGHans *)add:(NSInteger(^)(NSInteger num))block;

@end

NS_ASSUME_NONNULL_END
