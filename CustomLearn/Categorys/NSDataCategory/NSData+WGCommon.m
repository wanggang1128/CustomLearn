//
//  NSData+WGCommon.m
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import "NSData+WGCommon.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (WGCommon)

#pragma mark - 加密
/**
 *  md5加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)md5 {
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( self.bytes, (CC_LONG)self.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH *2];
    for(int i =0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}


@end
