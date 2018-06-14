//
//  WGContactTableViewCell.h
//  CustomLearn
//
//  Created by wanggang on 2017/8/7.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WGContactsModel.h"

@interface WGContactTableViewCell : UITableViewCell

//联系人模型
@property (nonatomic, strong) WGContactsModel *contactModel;

@end
