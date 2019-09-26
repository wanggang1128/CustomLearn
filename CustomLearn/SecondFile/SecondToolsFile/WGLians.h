//
//  WGLians.h
//  CustomLearn
//
//  Created by wanggang on 2019/8/21.
//  Copyright © 2019 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGLians : NSObject

@property (nonatomic, assign) NSInteger value;

-(WGLians *(^)(NSInteger num))add;

@end

NS_ASSUME_NONNULL_END
