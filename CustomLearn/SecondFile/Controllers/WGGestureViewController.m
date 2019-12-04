//
//  WGGestureViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/7/21.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGGestureViewController.h"
#import "WGUIGesture.h"
#import "SubUILongPressGestureRecognizer.h"



@interface WGGestureViewController ()<WGUIGestureDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UITextField *textFeild;

@end

@implementation WGGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    
//    [self screenSize];
    
//    [self addGesture];
    
    [self btnAddLongPress];
}

- (void)btnAddLongPress {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    SubUILongPressGestureRecognizer *longPre = [[SubUILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnLongPressed:)];
    longPre.addBtn = btn;
    longPre.minimumPressDuration = 0.8;
    [btn addGestureRecognizer:longPre];
    
    [self.view addSubview:btn];
    
    self.textFeild = [[UITextField alloc] initWithFrame:CGRectMake(0, btn.bottom+30, SCREEN_WIDTH, 40)];
    _textFeild.backgroundColor = UIColor.yellowColor;
    self.textFeild.placeholder = @"----";
    _textFeild.delegate = self;
    [self.view addSubview:self.textFeild];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    
}

- (void)btnClicked {
    
    NSLog(@"--->btnClicked");
}

- (void)btnLongPressed:(SubUILongPressGestureRecognizer *)sender {
        
    if (sender.state ==UIGestureRecognizerStateBegan) {
        [self beginDelete:sender.addBtn];
    } else if (sender.state ==UIGestureRecognizerStateEnded){
        [self endDelete];
    }
}

- (void)beginDelete:(UIButton *)btn {
    
    NSLog(@"--->beginDelete");
    
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(deledate:) userInfo:btn repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)endDelete {
    
    NSLog(@"--->endDelete");
    [self.timer invalidate];
    self.timer = nil;
}

- (void)deledate:(NSTimer *)timer {
    
    NSLog(@"--->delete-->%@", [timer userInfo]);
    [self.textFeild deleteBackward];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.view addSubview:self.imageView];
    
}

- (void)screenSize{
    if (IS_IPHONE_35_OR_LESS) {
        WGLog(@"手机4");
    }else if (IS_IPHONE_40){
        WGLog(@"手机5");
    }else if (IS_IPHONE_47){
        WGLog(@"手机6");
    }else if (IS_IPHONE_55){
        WGLog(@"手机6P");
    }else if (IS_IPHONE_X){
        WGLog(@"手机X");
    }else{
        WGLog(@"手机类型未知");
    }
}

- (void)addGesture{
    [_imageView addGestureRecognizer:[[WGUIGesture WGUIGestureShare] tapGesture]];
    [_imageView addGestureRecognizer:[[WGUIGesture WGUIGestureShare] doubleTapGesture]];
    [[[WGUIGesture WGUIGestureShare] tapGesture] requireGestureRecognizerToFail:[[WGUIGesture WGUIGestureShare] doubleTapGesture]];//单击这个手势需要在双击这个手势失败后再执行
    [_imageView addGestureRecognizer:[[WGUIGesture WGUIGestureShare] pinchGesture]];
    [_imageView addGestureRecognizer:[[WGUIGesture WGUIGestureShare] rotationGesture]];
    [_imageView addGestureRecognizer:[[WGUIGesture WGUIGestureShare] panGesture]];
    [_imageView addGestureRecognizer:[[WGUIGesture WGUIGestureShare] swipeGesture]];
    [[[WGUIGesture WGUIGestureShare] panGesture] requireGestureRecognizerToFail:[[WGUIGesture WGUIGestureShare] swipeGesture]];
    [_imageView addGestureRecognizer:[[WGUIGesture WGUIGestureShare] longPressGesture]];
    
    [WGUIGesture WGUIGestureShare].wguigestureDelegate = self;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(80, 120, 160, 240);
        _imageView.image = [UIImage imageNamed:@"gesture.png"];
        _imageView.userInteractionEnabled = YES;
        _imageView.multipleTouchEnabled = YES;
    }
    return _imageView;
}

#pragma mark -手势代理
-(void)tap:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect bounds = _imageView.bounds;
        bounds.size.width *=1.2;
        bounds.size.height *=1.2;
        _imageView.bounds = bounds;
    }];
}

- (void)doubleTap:(UITapGestureRecognizer *)doubleTap{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect bounds = _imageView.bounds;
        bounds.size.width /=1.2;
        bounds.size.height /=1.2;
        _imageView.bounds = bounds;
    }];
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch{
    _imageView.transform = CGAffineTransformScale(_imageView.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}

- (void)rotation:(UIRotationGestureRecognizer *)rotation{
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rotation.rotation);
    rotation.rotation = 0;
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint translation = [pan translationInView:self.view];
    CGPoint newCenter = CGPointMake(pan.view.center.x+ translation.x,
                                    pan.view.center.y + translation.y);//    限制屏幕范围：
    newCenter.y = MAX(pan.view.frame.size.height/2, newCenter.y);
    newCenter.y = MIN(self.view.frame.size.height - pan.view.frame.size.height/2,  newCenter.y);
    newCenter.x = MAX(pan.view.frame.size.width/2, newCenter.x);
    newCenter.x = MIN(self.view.frame.size.width - pan.view.frame.size.width/2,newCenter.x);
    pan.view.center = newCenter;
    [pan setTranslation:CGPointZero inView:self.view];
}

- (void)swipe:(UISwipeGestureRecognizer *)swipe{
     _imageView.alpha = _imageView.alpha - 0.2;
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress{
    if(longPress.state ==UIGestureRecognizerStateBegan)
    {
        self.view.backgroundColor = [UIColor blueColor];
    }
    else if(longPress.state == UIGestureRecognizerStateEnded)
    {
        self.view.backgroundColor = BACKGROUND_COLOR;
    }
}

@end
