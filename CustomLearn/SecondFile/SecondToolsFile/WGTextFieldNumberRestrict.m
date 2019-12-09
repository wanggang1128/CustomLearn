//
//  WGTextFieldNumberRestrict.m
//  CustomLearn
//
//  Created by wanggang on 2019/12/6.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGTextFieldNumberRestrict.h"

@implementation WGTextFieldNumberRestrict

- (void)textFieldDidChange:(UITextField *)textField {
    textField.text = stringFilter(textField.text, self.maxLength, ^BOOL(NSString * _Nonnull string) {
        
        return matchString(string, @"^\\d$");
    });
}

@end
