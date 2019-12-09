//
//  UITextField+WGTextFieldRestrict.m
//  CustomLearn
//
//  Created by wanggang on 2019/12/6.
//  Copyright © 2019 WG. All rights reserved.
//

#import "UITextField+WGTextFieldRestrict.h"
#import <objc/runtime.h>

@implementation UITextField (WGTextFieldRestrict)

- (NSUInteger)maxLength {
    
    NSNumber *maxLength = objc_getAssociatedObject(self, @selector(maxLength));
    return [maxLength unsignedIntegerValue];
}

- (void)setMaxLength:(NSUInteger)maxLength {
    
    NSNumber *number = [NSNumber numberWithUnsignedInteger:maxLength];
    objc_setAssociatedObject(self, @selector(maxLength), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.textFieldRestrict.maxLength = maxLength;
}

- (WGTextRestrictType)textRestrictType {
    NSNumber *value = objc_getAssociatedObject(self, @selector(textRestrictType));
    return (WGTextRestrictType)[value integerValue];
}

- (void)setTextRestrictType:(WGTextRestrictType)textRestrictType {
    
    NSNumber *number = [NSNumber numberWithInteger:textRestrictType];
    objc_setAssociatedObject(self, @selector(textRestrictType), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.textFieldRestrict = [WGTextFieldRestrict textFieldRestrictWithType:textRestrictType];

}

- (WGTextFieldRestrict *)textFieldRestrict {
    return objc_getAssociatedObject(self, @selector(textFieldRestrict));
}

- (void)setTextFieldRestrict:(WGTextFieldRestrict *)textFieldRestrict {
    
    if (self.textFieldRestrict) {
        [self removeTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    textFieldRestrict.maxLength = self.maxLength > 0?:NSUIntegerMax;
    [self addTarget:textFieldRestrict action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    objc_setAssociatedObject(self, @selector(textFieldRestrict), textFieldRestrict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
