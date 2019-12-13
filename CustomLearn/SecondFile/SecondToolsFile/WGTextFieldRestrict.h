//
//  WGTextFieldRestrict.h
//  CustomLearn
//
//  Created by wanggang on 2019/12/6.
//  Copyright © 2019 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WGTextRestrictType){
    WGTextRestrictTypeNumber = 1,
    WGTextRestrictTypeCharacter = 2,
    WGTextRestrictTypeDecimal = 3,
};

typedef BOOL(^WGStringFilter)(NSString *string);
typedef void(^WGTextFieldChangedBlock)(NSString *textFieldStr);

static inline NSString * stringFilter(NSString *filterString, NSUInteger maxLength, WGStringFilter filter){
    
    NSMutableString *mutString = filterString.mutableCopy;
    for (NSInteger index = 0; index < mutString.length; index ++) {
        NSString *subStr = [mutString substringWithRange:NSMakeRange(index, 1)];
        if (!filter(subStr)) {
            [mutString deleteCharactersInRange:NSMakeRange(index, 1)];
        }
    }
    if (mutString.length > maxLength) {
        NSString *resStr = [mutString substringToIndex:maxLength];
        return resStr;
    }
    return mutString;
}

static inline BOOL matchString(NSString *string, NSString *format){
    
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", format];
    BOOL isPre = [pre evaluateWithObject:string];
    return isPre;
}

@interface WGTextFieldRestrict : NSObject

@property (nonatomic, assign) WGTextRestrictType textRestrictType;
@property (nonatomic, assign) NSUInteger maxLength;

@property (nonatomic, copy) WGTextFieldChangedBlock textFieldChangedBlock;

+ (instancetype)textFieldRestrictWithType:(WGTextRestrictType)type;
- (void)textFieldDidChange:(UITextField *)textField;

@end

NS_ASSUME_NONNULL_END
