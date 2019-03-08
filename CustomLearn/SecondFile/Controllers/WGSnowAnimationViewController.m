//
//  WGSnowAnimationViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/3/8.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGSnowAnimationViewController.h"
#import "WGSnowView.h"

@interface WGSnowAnimationViewController ()

@property (nonatomic, strong)WGSnowView *snowView;

@end

@implementation WGSnowAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"雪花❄️动画";
    [self setViewView];
    
    [self.view addSubview:self.snowView];
    [_snowView begin];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.snowView removeFromSuperview];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

-(WGSnowView *)snowView{
    if (!_snowView) {
        _snowView = [WGSnowView snowBGImgView:@"backgound.jpg" snowName:@"snow" frame:self.view.frame];
    }
    return _snowView;
}

@end
