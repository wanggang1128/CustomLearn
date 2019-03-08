//
//  WGSnowView.m
//  CustomLearn
//
//  Created by wanggang on 2019/3/8.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGSnowView.h"

@implementation WGSnowView

+ (instancetype)snowBGImgView:(NSString *)bgImgName snowName:(NSString *)snowName frame:(CGRect)frame{
    
    WGSnowView *view = [[WGSnowView alloc] initWithFrame:frame];
    view.backImgView.image = [UIImage imageNamed:bgImgName];
    view.snowName = snowName;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backImgView = [[UIImageView alloc] init];
        _backImgView.frame = self.frame;
        _backImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_backImgView];
    }
    return self;
}

- (void)begin{
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)drawRect:(CGRect)rect{
    
    if (self.subviews.count >100) {
        return;
    }
    
    //❄️宽度
    NSInteger width = arc4random()%20+5;
    //❄️速度
    NSInteger speed = arc4random()%15+5;
    //❄️起点y
    NSInteger startY = -arc4random()%100;
    //❄️起点x
    NSInteger startX = arc4random()%(NSInteger)(SCREEN_WIDTH);
    //❄️终点x
    NSInteger endX = arc4random()%(NSInteger)(SCREEN_WIDTH);

    //雪花
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(startX, startY, width, width)];
    imgView.image = [UIImage imageNamed:self.snowName];
    [self addSubview:imgView];
    
    [UIView animateWithDuration:speed animations:^{
        //❄️最终frame
        imgView.frame = CGRectMake(endX, SCREEN_HEIGHT, width, width);
        //❄️旋转
        imgView.transform = CGAffineTransformRotate(imgView.transform, M_PI);
        //❄️透明度
        imgView.alpha = 0.3;
        
    } completion:^(BOOL finished) {
        
        [imgView removeFromSuperview];
    }];
}

@end
