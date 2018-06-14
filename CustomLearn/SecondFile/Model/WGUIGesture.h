//
//  WGUIGesture.h
//  CustomLearn
//
//  Created by wanggang on 2017/7/24.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WGUIGestureDelegate <NSObject>

- (void)tap:(UITapGestureRecognizer *)tap;
- (void)doubleTap:(UITapGestureRecognizer *)doubleTap;
- (void)pinch:(UIPinchGestureRecognizer *)pinch;
- (void)rotation:(UIRotationGestureRecognizer *)rotation;
- (void)pan:(UIPanGestureRecognizer *)pan;
- (void)swipe:(UISwipeGestureRecognizer *)swipe;
- (void)longPress:(UILongPressGestureRecognizer *)longPress;

@end

@interface WGUIGesture : UIGestureRecognizer

@property (nonatomic, weak) id<WGUIGestureDelegate>wguigestureDelegate;

+ (WGUIGesture *)WGUIGestureShare;

//单击
- (UITapGestureRecognizer *)tapGesture;
//双击
- (UITapGestureRecognizer *)doubleTapGesture;
//捏合
- (UIPinchGestureRecognizer *)pinchGesture;
//旋转
- (UIRotationGestureRecognizer *)rotationGesture;
//移动
- (UIPanGestureRecognizer *)panGesture;
//清扫
- (UISwipeGestureRecognizer *)swipeGesture;
//长按
- (UILongPressGestureRecognizer *)longPressGesture;

@end
