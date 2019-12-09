//
//  UITextField+WGtextFieldAdjust.m
//  CustomLearn
//
//  Created by wanggang on 2019/12/6.
//  Copyright © 2019 WG. All rights reserved.
//

#import "UITextField+WGtextFieldAdjust.h"
#import <objc/runtime.h>

@interface UITextField ()

@property (nonatomic, assign) BOOL isChange;
@property (nonatomic, assign) CGRect orignalFrame;

@end

@implementation UITextField (WGtextFieldAdjust)

- (void)setAutoAdjust: (BOOL)autoAdjust {
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    if (autoAdjust) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHiden:) name:UIKeyboardWillHideNotification object:nil];
    }
}

- (BOOL)isChange {
    
    NSNumber *value = objc_getAssociatedObject(self, @selector(isChange));
    return [value boolValue];
}

- (void)setIsChange:(BOOL)isChange {
    NSNumber *value = [NSNumber numberWithBool:isChange];
    objc_setAssociatedObject(self, @selector(isChange), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)orignalFrame {
    NSValue *value = objc_getAssociatedObject(self, @selector(orignalFrame));
    return [value CGRectValue];
}

- (void)setOrignalFrame:(CGRect)orignalFrame {
    
    NSValue *value = [NSValue valueWithCGRect:orignalFrame];
    objc_setAssociatedObject(self, @selector(orignalFrame), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)keyBoardWillShow:(NSNotification *)notification {
    
    self.orignalFrame = self.superview.viewController.view.frame;

    if (self.isFirstResponder) {
        CGPoint relativePoint = [self convertPoint: CGPointZero toView: self.superview.viewController.view];
    
        CGFloat keyboardHeight = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        CGFloat actualHeight = CGRectGetHeight(self.frame) + relativePoint.y + keyboardHeight;
        CGFloat overstep = actualHeight - CGRectGetHeight([UIScreen mainScreen].bounds) + 5;
        if (overstep > 0) {
            CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
            CGRect frame = self.superview.viewController.view.frame;
            frame.origin.y -= overstep;
            [UIView animateWithDuration: duration delay: 0 options: UIViewAnimationOptionCurveLinear animations: ^{
                self.superview.viewController.view.frame = frame;
                self.isChange = YES;
            } completion: nil];
        }
    }
}

- (void)keyBoardWillHiden:(NSNotification *)notification {
    
    if (self.isFirstResponder || self.isChange) {
        CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        [UIView animateWithDuration: duration delay: 0 options: UIViewAnimationOptionCurveLinear animations: ^{
            self.superview.viewController.view.frame = self.orignalFrame;
            self.isChange = NO;
        } completion: nil];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

@end
