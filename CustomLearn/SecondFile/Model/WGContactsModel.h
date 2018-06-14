//
//  WGContactsModel.h
//  CustomLearn
//
//  Created by wanggang on 2017/8/7.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGContactsModel : NSObject

//联系人id
@property (nonatomic, copy) NSString *contactId;
//联系人昵称
@property (nonatomic, copy) NSString *contactName;
//联系人头像
@property (nonatomic, copy) NSString *contactAvater;
//联系的最后时间
@property (nonatomic, copy) NSString *contactTime;
//联系人状态描述
@property (nonatomic, copy) NSString *contactDes;

@end
