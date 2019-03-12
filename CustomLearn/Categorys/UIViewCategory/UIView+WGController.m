//
//  UIView+WGController.m
//  CustomLearn
//
//  Created by wanggang on 2019/3/12.
//  Copyright © 2019 WG. All rights reserved.
//

#import "UIView+WGController.h"

@implementation UIView (WGController)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

//获取导航控制器
- (UINavigationController*)navigationController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController*)nextResponder;
        }
    }
    return nil;
}

@end
