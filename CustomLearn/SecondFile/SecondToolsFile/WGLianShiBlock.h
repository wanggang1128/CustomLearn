//
//  WGLianShiBlock.h
//  CustomLearn
//
//  Created by wanggang on 2018/6/13.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGLianShiBlock : NSObject

@property (nonatomic, assign) int result;

- (WGLianShiBlock*(^)(int num))add;

@end
