//
//  WGSnowAnimationViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/3/8.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGSnowAnimationViewController.h"
#import "WGSnowView.h"
#import "WGCAEmitterLayerView.h"

@interface WGSnowAnimationViewController ()

@property (nonatomic, strong)WGSnowView *snowView;
@property (nonatomic, strong)WGCAEmitterLayerView *snowView01;

@end

@implementation WGSnowAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"雪花❄️动画";
    [self setViewView];
    
    //第一种,较耗性能
//    [self.view addSubview:self.snowView];
//    [_snowView begin];
    
    //第二种比较好
    [self.view addSubview:self.snowView01];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
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

-(WGCAEmitterLayerView *)snowView01{
    if (!_snowView01) {
        _snowView01 = [[WGCAEmitterLayerView alloc] initWithFrame:self.view.frame bgImgView:@"backgound.jpg"];
    }
    return _snowView01;
}

@end
