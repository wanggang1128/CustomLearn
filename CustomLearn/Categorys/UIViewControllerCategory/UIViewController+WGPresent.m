//
//  UIViewController+WGPresent.m
//  CustomLearn
//
//  Created by wanggang on 2019/9/26.
//  Copyright © 2019 WG. All rights reserved.
//

#import "UIViewController+WGPresent.h"
#import <objc/runtime.h>

@implementation UIViewController (WGPresent)

+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL oldSel = @selector(presentViewController:animated:completion:);
        SEL newSel = @selector(wg_presentViewController:animated:completion:);
        
        Method old = class_getInstanceMethod([self class], oldSel);
        Method new = class_getInstanceMethod([self class], newSel);
        if (class_addMethod([self class], oldSel, method_getImplementation(new), method_getTypeEncoding(new))) {
            
            class_replaceMethod([self class], newSel, method_getImplementation(old), method_getTypeEncoding(old));
        }else {
            
            method_exchangeImplementations(old, new);
        }
    });
}

- (void)wg_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if (@available(iOS 13.0, *)) {
        
        if (viewControllerToPresent.wg_setModalPresentationStyle) {
            
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
        }
    }
    [self wg_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (BOOL)wg_setModalPresentationStyle {
    
    NSNumber *obj = objc_getAssociatedObject(self, @selector(wg_setModalPresentationStyle));
    return obj ? [obj boolValue] : [self.class wg_GlobalSetModalPresentationStyle];
}

-(void)setWg_setModalPresentationStyle:(BOOL)wg_setModalPresentationStyle {
    
    objc_setAssociatedObject(self, @selector(wg_setModalPresentationStyle), @(wg_setModalPresentationStyle), OBJC_ASSOCIATION_ASSIGN);
}

//以后迭代版本,想全部用系统之前样式(排除UIImagePickerController,UIAlertController)
+ (BOOL)wg_GlobalSetModalPresentationStyle {
    
    if ([self isKindOfClass:[UIImagePickerController class]] || [self isKindOfClass:[UIAlertController class]]) {
        
        return NO;
    }
    return YES;
}

@end
