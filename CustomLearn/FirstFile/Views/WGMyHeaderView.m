//
//  WGMyHeaderView.m
//  CustomLearn
//
//  Created by wanggang on 2019/10/12.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGMyHeaderView.h"

@implementation WGMyHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createView];
    }
    
    return self;
}

- (void)createView {
    
    self.backgroundColor = UIColor.whiteColor;
}

-(void)drawRect:(CGRect)rect {
    
    float x = rect.origin.x;
    float y = rect.origin.y;
    float w = rect.size.width;
    float h = rect.size.height;
    // 一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 画笔线的颜色
    CGContextSetRGBStrokeColor(context,1,0,0,0);
    // 线的宽度
    CGContextSetLineWidth(context, 1.0);
    // 填充颜色
    UIColor *fullColor = [UIColor redColor];
    CGContextSetFillColorWithColor(context, fullColor.CGColor);

    // 绘制路径
    CGContextMoveToPoint(context, x, y);
    CGContextAddLineToPoint(context, x, h-30);
    CGContextAddArcToPoint(context, w/2.0, h, w, h-30, w*2);
    CGContextAddLineToPoint(context, w, h-30);
    CGContextAddLineToPoint(context, w, y);
    CGContextAddLineToPoint(context, x, y);
    
//    // 绘制路径加填充
    CGContextDrawPath(context, kCGPathFillStroke);

    
}

@end
