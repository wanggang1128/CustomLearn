//
//  WGJsonmodel.h
//  CustomLearn
//
//  Created by wanggang on 2018/2/23.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "JSONModel.h"

@protocol Cat
@end

@interface Cat :JSONModel

@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) long products;

@end

@interface WGJsonmodel : JSONModel

@property (strong, nonatomic) NSString *source;
@property (strong, nonatomic) NSString *agent;
@property (strong, nonatomic) NSString *client;
@property (nonatomic, strong) NSArray<Cat> *categories;

@end
