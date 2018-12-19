//
//  NSString+WGCommon.h
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WGCommon)

#pragma mark - 判断特殊字符
- (BOOL)empty;
- (BOOL)isInteger;
- (BOOL)isFloat;
- (BOOL)isHasSpecialcharacters;
- (BOOL)isHasNumder;

#pragma mark - 时间戳转换
- (NSDate *)dateValueWithMillisecondsSince1970;
- (NSDate *)dateValueWithTimeIntervalSince1970;

#pragma 计算字数(中英混合 都算一个)
- (NSInteger)stringLength;

#pragma mark - 计算是否含有
- (BOOL)containString:(NSString *)string;
- (BOOL)containsChineseCharacter;

#pragma mark - 计算字符串尺寸
- (CGSize)heightWithWidth:(CGFloat)width andFont:(CGFloat)font;
- (CGSize)widthWithHeight:(CGFloat)height andFont:(CGFloat)font;

#pragma mark - 正则匹配
- (BOOL)isEmail;
- (BOOL)isUrl;
- (BOOL)isTelephone;
- (BOOL)isValidZipcode;
- (BOOL)isPassword;

- (BOOL)isNumbers;
- (BOOL)isLetter;
- (BOOL)isCapitalLetter;
- (BOOL)isSmallLetter;
- (BOOL)isLetterAndNumbers;
- (BOOL)isChineseAndLetterAndNumberAndBelowLine;
- (BOOL)isChineseAndLetterAndNumberAndBelowLine4to10;
- (BOOL)isChineseAndLetterAndNumberAndBelowLineNotFirstOrLast;
- (BOOL)isBelow7ChineseOrBlow14LetterAndNumberAndBelowLine;

#pragma mark - 加密
// md5
- (NSString*)md5;

#pragma mark - 获得特殊字符串
+ (NSString*)getTimeAndRandomString;

#pragma mark - json转义
- (NSString *)changeJsonEnter;
#pragma mark -  email 转换为 312******@qq.com 形式
- (NSString *)emailChangeToPrivacy;

#pragma mark - Emoji
- (BOOL)isIncludingEmoji;
- (instancetype)removedEmojiString;

@end

NS_ASSUME_NONNULL_END
