//
//  WGHanShuShiBlock.h
//  CustomLearn
//
//  Created by wanggang on 2018/12/4.
//  Copyright © 2018 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGHanShuShiBlock : NSObject

@property (nonatomic, assign) int result;

- (WGHanShuShiBlock *)caculator:(int(^)(int value))block;

@end

NS_ASSUME_NONNULL_END
