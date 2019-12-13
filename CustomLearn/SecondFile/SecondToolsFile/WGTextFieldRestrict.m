//
//  WGTextFieldRestrict.m
//  CustomLearn
//
//  Created by wanggang on 2019/12/6.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGTextFieldRestrict.h"
#import "WGTextFieldNumberRestrict.h"
#import "WGTextFieldCharacterRestrict.h"
#import "WGTextFieldDecimalRestrict.h"

@implementation WGTextFieldRestrict

+ (instancetype)textFieldRestrictWithType:(WGTextRestrictType)type {
    
    WGTextFieldRestrict *share;
    switch (type) {
        case WGTextRestrictTypeNumber:{
            share = [[WGTextFieldNumberRestrict alloc] init];
        }
            break;
        case WGTextRestrictTypeCharacter:{
            share = [[WGTextFieldCharacterRestrict alloc] init];
        }
            break;
        case WGTextRestrictTypeDecimal:{
            share = [[WGTextFieldDecimalRestrict alloc] init];
        }
            break;
            
        default:
            break;
    }
    share.maxLength = NSUIntegerMax;
    share.textRestrictType = type;
    return share;
}

- (void)textFieldDidChange:(UITextField *)textField {
    
    if (self.textFieldChangedBlock) {
        self.textFieldChangedBlock(textField.text);
    }
}

@end
