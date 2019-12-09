//
//  UITextField+WGTextFieldRestrict.h
//  CustomLearn
//
//  Created by wanggang on 2019/12/6.
//  Copyright © 2019 WG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WGTextFieldRestrict.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (WGTextFieldRestrict)

@property (nonatomic, assign) NSUInteger maxLength;
@property (nonatomic, assign) WGTextRestrictType textRestrictType;
@property (nonatomic, strong) WGTextFieldRestrict *textFieldRestrict;

@end

NS_ASSUME_NONNULL_END
