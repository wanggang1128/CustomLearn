//
//  WGNSTimerTestViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/3/7.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGNSTimerTestViewController.h"

@interface WGNSTimerTestViewController ()

@property (nonatomic, strong) dispatch_source_t gcdTimer;

@end

@implementation WGNSTimerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"NSTimer准吗?";
    [self setViewView];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self test01];
    [self test02];
//    [self test03];
}

- (void)test03{
    
    //1.创建GCD中的定时器
    /*
     第一个参数:创建source的类型 DISPATCH_SOURCE_TYPE_TIMER:定时器
     第二个参数:0
     第三个参数:0
     第四个参数:队列
     */
    self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    //2.设置时间等
    /*
     第一个参数:定时器对象
     第二个参数:DISPATCH_TIME_NOW 表示从现在开始计时
     第三个参数:间隔时间 GCD里面的时间最小单位为 纳秒
     第四个参数:精准度(表示允许的误差,0表示绝对精准)
     */
    dispatch_source_set_timer(_gcdTimer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    //3.要调用的任务
    dispatch_source_set_event_handler(_gcdTimer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSInteger count = 0;
            for (NSInteger i = 0; i < 1000000000; i++) {
                count += i;
            }
            NSLog(@"test03Method");
            
        });
        NSLog(@"test03%@", [NSThread currentThread]);
    });
    
    //4.开始执行
    dispatch_resume(_gcdTimer);
}

- (void)test02{
    NSThread *thead = [[NSThread alloc] initWithTarget:self selector:@selector(test02Method) object:nil];
    [thead start];
}

- (void)test02Method{
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] run];
}

- (void)showTime{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSInteger count = 0;
        for (NSInteger i = 0; i < 1000000000; i++) {
            count += i;
        }
        NSLog(@"test02Method");
        
    });
    NSLog(@"test02%@", [NSThread currentThread]);

}

- (void)test01{
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(test01Method) userInfo:nil repeats:YES];
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop addTimer:timer forMode:NSRunLoopCommonModes];
    [loop run];
}

- (void)test01Method{
    NSInteger count = 0;
    for (NSInteger i = 0; i < 1000000000; i++) {
        count += i;
    }
    NSLog(@"test01Method");
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

@end
