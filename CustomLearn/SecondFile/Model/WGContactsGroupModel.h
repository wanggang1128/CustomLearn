//
//  WGContactsGroupModel.h
//  CustomLearn
//
//  Created by wanggang on 2017/8/7.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGContactsGroupModel : NSObject

//群ID
@property (nonatomic, copy) NSString *groupId;
//群名称
@property (nonatomic, copy) NSString *groupName;
//群类型  1未分组  2自定义分组
@property (nonatomic, assign) NSInteger groupType;
//群成员数量
@property (nonatomic, assign) NSInteger numbersOfGroup;
//群成员数组
@property (nonatomic, copy) NSArray *mumbersArr;

@end
