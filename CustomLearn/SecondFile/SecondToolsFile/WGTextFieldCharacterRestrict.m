//
//  WGTextFieldCharacterRestrict.m
//  CustomLearn
//
//  Created by wanggang on 2019/12/6.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGTextFieldCharacterRestrict.h"

@implementation WGTextFieldCharacterRestrict

- (void)textFieldDidChange:(UITextField *)textField {
    textField.text = stringFilter(textField.text, self.maxLength, ^BOOL(NSString * _Nonnull string) {
        
        return matchString(string, @"^[^[\\u4e00-\\u9fa5]]$");
    });
    if (self.textFieldChangedBlock) {
        self.textFieldChangedBlock(textField.text);
    }
}

@end
