//
//  WGUIGesture.m
//  CustomLearn
//
//  Created by wanggang on 2017/7/24.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGUIGesture.h"

@interface WGUIGesture()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic, strong) UIPinchGestureRecognizer *pinch;
@property (nonatomic, strong) UIRotationGestureRecognizer *rotation;
@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipe;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;

@end

@implementation WGUIGesture

static WGUIGesture *gesture = nil;
+ (WGUIGesture *)WGUIGestureShare{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gesture = [[WGUIGesture alloc] init];
    });
    return gesture;
}

- (UITapGestureRecognizer *)tapGesture{
    //单击
    return self.singleTap;
}

- (UITapGestureRecognizer *)doubleTapGesture{
    //双击
    return self.doubleTap;
}

- (UIPinchGestureRecognizer *)pinchGesture{
    //捏合手势
    return self.pinch;
}

- (UIRotationGestureRecognizer *)rotationGesture{
    return self.rotation;
}

- (UIPanGestureRecognizer *)panGesture{
    return self.pan;
}

- (UISwipeGestureRecognizer *)swipeGesture{
    return self.swipe;
}

- (UILongPressGestureRecognizer *)longPressGesture{
    return self.loogPress;
}

- (UITapGestureRecognizer *)singleTap{
    if (!_singleTap) {
        _singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        _singleTap.numberOfTapsRequired = 1;//需要轻击的次数 默认为1
        _singleTap.numberOfTouchesRequired = 1;//响应这个时间需要的手指个数默认为1
    }
    return _singleTap;
}

- (UITapGestureRecognizer *)doubleTap{
    if (!_doubleTap) {
        _doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
        _doubleTap.numberOfTapsRequired = 2;//需要轻击的次数 默认为1
    }
    return _doubleTap;
}

- (UIPinchGestureRecognizer *)pinch{
    if (!_pinch) {
        _pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
        _pinch.delegate = self;
    }
    return _pinch;
}

- (UIRotationGestureRecognizer *)rotation{
    if (!_rotation) {
        _rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
        _rotation.delegate = self;
    }
    return _rotation;
}

- (UIPanGestureRecognizer *)pan{
    if (!_pan) {
        _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    }
    return _pan;
}

- (UISwipeGestureRecognizer *)swipe{
    if (!_swipe) {
        _swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        _swipe.direction = UISwipeGestureRecognizerDirectionUp;
    }
    return _swipe;
}

- (UILongPressGestureRecognizer *)loogPress{
    if (!_longPress) {
        _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        _longPress.minimumPressDuration = 2;
        _longPress.allowableMovement = 20;
    }
    return _longPress;
}

#pragma mark - 单击
- (void)tap:(UITapGestureRecognizer *)tap{
    if (self.wguigestureDelegate && [self.wguigestureDelegate respondsToSelector:@selector(tap:)]) {
        [self.wguigestureDelegate tap:tap];
    }
}

#pragma mark - 双击
- (void)doubleTap:(UITapGestureRecognizer *)tap{
    if (self.wguigestureDelegate && [self.wguigestureDelegate respondsToSelector:@selector(doubleTap:)]) {
        [self.wguigestureDelegate doubleTap:tap];
    }
}

#pragma mark - 捏合手势
- (void)pinch:(UIPinchGestureRecognizer *)pinch{
    if (self.wguigestureDelegate && [self.wguigestureDelegate respondsToSelector:@selector(pinch:)]) {
        [self.wguigestureDelegate pinch:pinch];
    }
}

#pragma mark -旋转
- (void)rotation:(UIRotationGestureRecognizer *)rotation{
    if (self.wguigestureDelegate && [self.wguigestureDelegate respondsToSelector:@selector(rotation:)]) {
        [self.wguigestureDelegate rotation:rotation];
    }
}

#pragma mark -移动
- (void)pan:(UIPanGestureRecognizer *)pan{
    if (self.wguigestureDelegate && [self.wguigestureDelegate respondsToSelector:@selector(pan:)]) {
        [self.wguigestureDelegate pan:pan];
    }
}

#pragma mark -清扫
- (void)swipe:(UISwipeGestureRecognizer *)swipe{
    if (self.wguigestureDelegate && [self.wguigestureDelegate respondsToSelector:@selector(swipe:)]) {
        [self.wguigestureDelegate swipe:swipe];
    }
}

#pragma mark -长按
- (void)longPress:(UILongPressGestureRecognizer *)longPress{
    if (self.wguigestureDelegate && [self.wguigestureDelegate respondsToSelector:@selector(longPress:)]) {
        [self.wguigestureDelegate longPress:longPress];
    }
}

@end
