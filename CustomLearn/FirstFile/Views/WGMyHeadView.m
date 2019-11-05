//
//  WGMyHeadView.m
//  CustomLearn
//
//  Created by wanggang on 2019/10/12.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGMyHeadView.h"

@interface WGMyHeadView ()

@property (nonatomic, strong) UIView *headBGView;
@property (nonatomic, strong) UIView *btnBGView;
@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UILabel *phoneLab;
@property (nonatomic, strong) UIButton *signInBtn;
@property (nonatomic, strong) UIButton *serviceBtn;
@property (nonatomic, strong) UIButton *integralBtn;
@property (nonatomic, strong) UIButton *giftCertificateBtn;
@property (nonatomic, strong) UIButton *rightsBtn;
@property (nonatomic, strong) UIButton *collectBtn;


@end

@implementation WGMyHeadView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createView];
        [self createUI];
    }
    
    return self;
}

- (void)createView {
    
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建CGMutablePathRef
    float x = 0;
    float y = 0;
    float w = self.bounds.size.width;
    float h = self.bounds.size.height;
    
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
    //绘制路径
    CGPathMoveToPoint(path, NULL, x, y);
    CGPathAddLineToPoint(path, NULL, x, h-30);
    CGPathAddArcToPoint(path, NULL,w/2.0, h, w, h-30, w*2);
    CGPathAddLineToPoint(path, NULL, w, h-30);
    CGPathAddLineToPoint(path, NULL, w, y);
    CGPathAddLineToPoint(path, NULL, x, y);
    CGPathCloseSubpath(path);
    
    //绘制渐变色
    [self drawLinearGradient:context path:path startColor:[WGGlobleMethod uiColorFromString:@"#E6544A"].CGColor endColor:[WGGlobleMethod uiColorFromString:@"#BF161E"].CGColor];
    
    CGPathRelease(path);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self addSubview:imgView];
}

- (void)createUI {
    
    [self addSubview:self.headBGView];
    [self addSubview:self.btnBGView];
    
    [self.headBGView addSubview:self.headImgView];
    [self.headBGView addSubview:self.phoneLab];
    [self.headBGView addSubview:self.signInBtn];
    [self.headBGView addSubview:self.serviceBtn];
    
    [self.btnBGView addSubview:self.integralBtn];
    [self.btnBGView addSubview:self.giftCertificateBtn];
    [self.btnBGView addSubview:self.rightsBtn];
    [self.btnBGView addSubview:self.collectBtn];
}

- (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };

    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
     
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);

    CGRect pathRect = CGPathGetBoundingBox(path);
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMinY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMaxY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (void)setBtnStyle:(UIButton *)btn {
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 9;
    NSString *content = btn.titleLabel.text;
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:content];
    [attStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, content.length)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(content.length-2, 2)];
    [btn setAttributedTitle:attStr forState:UIControlStateNormal];
}


-(UIView *)headBGView {
    
    if (!_headBGView) {
        _headBGView = [[UIView alloc] initWithFrame:CGRectMake(16, 25, self.width-16*2, 30)];
    }
    return _headBGView;
}

-(UIView *)btnBGView {
    
    if (!_btnBGView) {
        _btnBGView = [[UIView alloc] initWithFrame:CGRectMake(self.headBGView.left, self.headBGView.bottom+24, self.width-16*2, 40)];
    }
    return _btnBGView;
}

-(UIImageView *)headImgView {
    
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _headImgView.backgroundColor = UIColor.yellowColor;
    }
    return _headImgView;
}

-(UILabel *)phoneLab {
    
    if (!_phoneLab) {
        _phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.right+8, _headImgView.top, 102, _headImgView.height)];
        _phoneLab.text = @"12345678901";
        _phoneLab.textAlignment = NSTextAlignmentCenter;
        _phoneLab.textColor = UIColor.whiteColor;
    }
    return _phoneLab;
}

-(UIButton *)signInBtn {
    
    if (!_signInBtn) {
        _signInBtn = [[UIButton alloc] initWithFrame:CGRectMake(_phoneLab.right+8, _phoneLab.top, 60, _phoneLab.height)];
        _signInBtn.backgroundColor = [WGGlobleMethod uiColorFromString:@"#E88D8A"];
        [_signInBtn setTitle:@"签到" forState:UIControlStateNormal];
    }
    return _signInBtn;
}

-(UIButton *)serviceBtn {
    
    if (!_serviceBtn) {
        _serviceBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.width-16*2-30, _phoneLab.top, 30, 30)];
        _serviceBtn.backgroundColor = [UIColor yellowColor];
    }
    return _serviceBtn;
}

-(UIButton *)integralBtn {
    
    if (!_integralBtn) {
        UIButton *temBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 65, 40)];
        [temBtn setTitle:@"200\n积分" forState:UIControlStateNormal];
        temBtn.titleLabel.lineBreakMode = 0;
        temBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self setBtnStyle:temBtn];
        _integralBtn = temBtn;
    }
    return _integralBtn;
}

-(UIButton *)giftCertificateBtn {
    
    if (!_giftCertificateBtn) {
        UIButton *temBtn = [[UIButton alloc] initWithFrame:CGRectMake(_integralBtn.right+37, 0, 65, 40)];
        [temBtn setTitle:@"20\n积分" forState:UIControlStateNormal];
        temBtn.titleLabel.lineBreakMode = 0;
        temBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self setBtnStyle:temBtn];
        _giftCertificateBtn = temBtn;
    }
    return _giftCertificateBtn;
}

-(UIButton *)rightsBtn {
    
    if (!_rightsBtn) {
        UIButton *temBtn = [[UIButton alloc] initWithFrame:CGRectMake(_giftCertificateBtn.right+37, 0, 65, 40)];
        [temBtn setTitle:@"200\n积分" forState:UIControlStateNormal];
        temBtn.titleLabel.lineBreakMode = 0;
        temBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self setBtnStyle:temBtn];
        _rightsBtn = temBtn;
    }
    return _rightsBtn;
}

-(UIButton *)collectBtn {
    
    if (!_collectBtn) {
        UIButton *temBtn = [[UIButton alloc] initWithFrame:CGRectMake(_rightsBtn.right+37, 0, 65, 40)];
        [temBtn setTitle:@"200\n积分" forState:UIControlStateNormal];
        temBtn.titleLabel.lineBreakMode = 0;
        temBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self setBtnStyle:temBtn];
        _collectBtn = temBtn;
    }
    return _collectBtn;
}

@end
