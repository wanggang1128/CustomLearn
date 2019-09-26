//
//  UIViewController+WGPresent.h
//  CustomLearn
//
//  Created by wanggang on 2019/9/26.
//  Copyright © 2019 WG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (WGPresent)

// 某个控制器想用系统默认,则设置NO
@property (nonatomic, assign) BOOL wg_setModalPresentationStyle;


@end

NS_ASSUME_NONNULL_END
