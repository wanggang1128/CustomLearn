//
//  WGCAEmitterLayerView.m
//  CustomLearn
//
//  Created by wanggang on 2019/3/8.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGCAEmitterLayerView.h"

@interface WGCAEmitterLayerView()

@property (nonatomic, strong) CAEmitterLayer *snowEmitterLayer;
@property (nonatomic, strong) UIImageView *backgroundView;

@end

@implementation WGCAEmitterLayerView

- (instancetype)initWithFrame:(CGRect)frame bgImgView:(NSString *)imgName{
    
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundView = [[UIImageView alloc] initWithFrame:frame];
        _backgroundView.image = [UIImage imageNamed:imgName];
        [self addSubview:_backgroundView];
        [self buildView];
    }
    return self;
}

- (void)buildView{
    //粒子发射器图层
    self.snowEmitterLayer = [CAEmitterLayer layer];
    //粒子发射器位置
    _snowEmitterLayer.emitterPosition = CGPointMake(0, -30);
    //粒子发射器的范围
    _snowEmitterLayer.emitterSize = CGSizeMake(SCREEN_WIDTH*2, 0);
    //发射模式
    _snowEmitterLayer.emitterMode=kCAEmitterLayerOutline;
    //粒子模式
    _snowEmitterLayer.emitterShape=kCAEmitterLayerLine;
    
    //创建粒子
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    //设置粒子内容
    emitterCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"snow"].CGImage);
    //设置粒子缩放比例
    emitterCell.scale = 0.02;
    //缩放范围
    emitterCell.scaleRange = 0.5;
    //每秒粒子产生数量
    emitterCell.birthRate=50;
    //粒子生命周期
    emitterCell.lifetime=80;
    //粒子透明速度
    emitterCell.alphaSpeed=-0.01;
    //粒子速度
    emitterCell.velocity=80;
    emitterCell.velocityRange=50;
    //设置角度
    emitterCell.emissionRange=M_PI;
    //设置粒子旋转角速度
    emitterCell.spin=M_PI_4;
    
    //设置layer阴影
    _snowEmitterLayer.shadowOpacity=1.0;
    //设置圆角
    _snowEmitterLayer.shadowRadius=8;
    //设置偏移
    _snowEmitterLayer.shadowOffset=CGSizeMake(3, 3);
    //设置颜色
    _snowEmitterLayer.shadowColor=[UIColor whiteColor].CGColor
    ;
    //设置layer的粒子
    _snowEmitterLayer.emitterCells=@[emitterCell];
    
    [self.layer addSublayer:_snowEmitterLayer];
}

@end
