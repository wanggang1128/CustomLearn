//
//  WGSnowView.h
//  CustomLearn
//
//  Created by wanggang on 2019/3/8.
//  Copyright © 2019 WG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGSnowView : UIView

@property (nonatomic, strong) UIImageView *backImgView;
@property (nonatomic, copy) NSString *snowName;

+ (instancetype)snowBGImgView:(NSString *)bgImgName snowName:(NSString *)snowName frame:(CGRect)frame;

- (void)begin;

@end

NS_ASSUME_NONNULL_END
