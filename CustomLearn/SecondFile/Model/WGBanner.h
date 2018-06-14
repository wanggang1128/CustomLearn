//
//  WGBanner.h
//  CustomLearn
//
//  Created by wanggang on 2017/7/26.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(int,WGScrollPageViewPosition){
    WGScrollPageViewPositionBottomLeft = 0,
    WGScrollPageViewPositionBottomMiddle = 1,
    WGScrollPageViewPositionBottomRight = 2,
};

@protocol WGBannerDelegate <NSObject>

- (void)currentPageClick:(NSInteger)clickIndex;

@end

@interface WGBanner : UIView

@property (nonatomic, strong) NSArray *imagesArr;
@property (nonatomic, strong) NSArray *descriptionArr;
@property (nonatomic, assign) NSTimeInterval pageChangeTime;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) WGScrollPageViewPosition pageControlLocation;
@property (nonatomic, weak)   id<WGBannerDelegate>wgBannerDelegate;

- (instancetype)initWithImages:(NSArray *)imagesArr frame:(CGRect)frame;

@end
