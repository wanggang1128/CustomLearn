//
//  NSBundle+WGCommon.m
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#import "NSBundle+WGCommon.h"

@implementation NSBundle (WGCommon)

/**
 *  获取资源bundle
 *  @param bundleName 组件名字
 *  @param targetClass 文件所在的类
 *  @return 获得的路径
 */
+ (instancetype)wg_subBundleWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass{
    //并没有拿到子bundle
    NSBundle *bundle = [NSBundle bundleForClass:targetClass];
    //在这个路径下找到子bundle的路径
    NSString *path = [bundle pathForResource:bundleName ofType:@"bundle"];
    //根据路径拿到子bundle
    return path?[NSBundle bundleWithPath:path]:[NSBundle mainBundle];
    
    /*
     这种方式也可以
     NSBundle *bundle = [NSBundle bundleForClass:targetClass];
     NSURL *url = [bundle URLForResource:bundleName withExtension:@"bundle"];
     return path?[NSBundle bundleWithURL:url]:[NSBundle mainBundle];
     */
}

/**
 *  获取icon的路径
 *
 *  @return 获得的路径
 */
- (NSString*)appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

/**
 *  获取appIcon
 *
 *  @return 得到的iconImage
 */
- (UIImage*)appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self appIconPath]] ;
    return appIcon;
}

@end
