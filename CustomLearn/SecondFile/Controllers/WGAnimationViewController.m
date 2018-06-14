//
//  WGAnimationViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/9/4.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGAnimationViewController.h"

@interface WGAnimationViewController ()

@property (nonatomic, strong) UIView *oneView;
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) UIButton *btn;


@end

@implementation WGAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
//    [self viewTest];
    [self layerTest];
    
}

- (void)viewTest{
    self.oneView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 150, 150)];
    self.oneView.backgroundColor = [UIColor whiteColor];
    self.oneView.layer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view addSubview:_oneView];
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 200, 50)];
    [_btn setTitle:@"改变颜色" forState:UIControlStateNormal];
    [_btn setBackgroundColor:[UIColor grayColor]];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(viewBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}

- (void)layerTest{
    
    self.oneView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 150, 150)];
    self.oneView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_oneView];
    
    self.layer = [CALayer layer];
    self.layer.frame = CGRectMake(25, 35, 100, 80);
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    [_oneView.layer addSublayer:_layer];
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 200, 50)];
    [_btn setTitle:@"改变颜色" forState:UIControlStateNormal];
    [_btn setBackgroundColor:[UIColor grayColor]];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(layerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}

- (void)layerBtnClicked{
    
    [CATransaction begin];
    //可以用来对所有属性打开或者关闭隐式动画
    [CATransaction setDisableActions:YES];
    [CATransaction setAnimationDuration:1.5];
    
    //在颜色变化结束之后执行一些操作,我们来添加一个完成之后的block，用来在每次颜色变化结束之后切换到另一个旋转90的动画。
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.layer.affineTransform;
        transform  = CGAffineTransformRotate(transform, M_PI_2);
        self.layer.affineTransform = transform;
        
    }];
    
    float red = arc4random()/INT_MAX;
    float green = arc4random()/INT_MAX;
    float blue = arc4random()/INT_MAX;
    self.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
}

- (void)viewBtnClicked{
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.5];
    
    float red = arc4random()/INT_MAX;
    float green = arc4random()/INT_MAX;
    float blue = arc4random()/INT_MAX;
    self.oneView.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

@end
