//
//  WGAnimationStudyViewC.m
//  CustomLearn
//
//  Created by wanggang on 2018/3/16.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "WGAnimationStudyViewC.h"

@interface WGAnimationStudyViewC ()

@property (nonatomic, strong) UIView *oneView;

@end

@implementation WGAnimationStudyViewC

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self setViewView];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self animation01:touches.anyObject];
//    [self animation02];
//    [self animation03];
//    [self animation04];
//    [self animation05];
    [self animation06];
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"弹框" message:@"111" preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"提示" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//
//    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//
//    [alert addAction: okAction];
//    [alert addAction:cancleAction];
//
//    [self presentViewController:alert animated:YES completion:nil];
}

- (void)animation06{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(100, 150)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(300, 250)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(400, 300)];
    anim.values = @[v1,v2,v3,v4];
    
    anim.duration = 5;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.oneView.layer addAnimation:anim forKey:nil];
}

//CABasicAnimation 基本动画
- (void)animation05{
    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.keyPath = @"position";
    ani.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    ani.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    ani.duration = 3;
    
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    
    [self.oneView.layer addAnimation:ani forKey:nil];
}

- (void)animation04{
    self.oneView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [UIView animateWithDuration:3 animations:^{
        self.oneView.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
    }];
}

- (void)animation03{
    self.oneView.alpha = 0;
    /*
     animateWithDuration 动画持续时间
     delay 动画延迟执行的时间
     usingSpringWithDamping 震动效果，范围0~1，数值越小震动效果越明显
     initialSpringVelocity 初始速度，数值越大初始速度越快
     options 动画的过渡效果
     */
    [UIView animateWithDuration:3 delay:1 usingSpringWithDamping:0.3 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.oneView.alpha = 1.0;
        self.oneView.frame = CGRectMake(200, 350, 140, 140);
    } completion:^(BOOL finished) {
        [self.oneView removeFromSuperview];
        self.oneView = nil;
    }];
}

- (void)animation02{
    [UIView beginAnimations:@"test" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    /*
     UIViewAnimationTransitionNone,
     UIViewAnimationTransitionFlipFromLeft,
     UIViewAnimationTransitionFlipFromRight,
     UIViewAnimationTransitionCurlUp,
     UIViewAnimationTransitionCurlDown,
     */
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.oneView cache:YES];
    
    [UIView commitAnimations];
}

//移动+放大
- (void)animation01:(UITouch *)touch{
    CGPoint point = [touch locationInView:self.view];
    
    [UIView beginAnimations:@"WGAnimation" context:nil];
    [UIView setAnimationDuration:5.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    //设置动画将开始时代理对象执行的SEL
    [UIView setAnimationWillStartSelector:@selector(animationStart)];
    //设置动画延迟执行时间
    [UIView setAnimationDelay:0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //设置动画是否继续执行相反的动画
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.oneView.center = point;
    self.oneView.transform = CGAffineTransformMakeScale(2, 2);
    self.oneView.transform = CGAffineTransformMakeRotation(M_PI);
    
    [UIView commitAnimations];
}

- (void)animationStart{
    NSLog(@"执行动画开始animationStart:%@", [NSThread currentThread]);
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(UIView *)oneView{
    if (!_oneView) {
        _oneView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _oneView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_oneView];
    }
    return _oneView;
}










@end
