//
//  NSBundle+WGCommon.h
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (WGCommon)

+ (instancetype)wg_subBundleWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass;

- (NSString *)appIconPath;
- (UIImage *)appIcon;

@end

NS_ASSUME_NONNULL_END
