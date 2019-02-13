//
//  WGXibViewController.h
//  CustomLearn
//
//  Created by wanggang on 2019/2/13.
//  Copyright © 2019 WG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGXibViewController : UIViewController

@property (nonatomic, strong) NSString *name;

- (instancetype) initWithAge:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END
