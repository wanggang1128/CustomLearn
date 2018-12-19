//
//  WGBlockTestViewController.m
//  CustomLearn
//
//  Created by wanggang on 2018/6/13.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "WGBlockTestViewController.h"
#import "WGLianShiBlock.h"
#import "WGBannerViewController.h"
#import <objc/runtime.h>
#import "WGHanShuShiBlock.h"

typedef void(^BlockTest)(void);

@interface WGBlockTestViewController ()

@property (nonatomic, copy) BlockTest blockTest;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) id target;

@end

@implementation WGBlockTestViewController

static const void *key = @"key";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    
    /*
     block如何修改block外部的局部变量值
     */
//    [self blockTest01];
//    [self blockTest02];
    
    /*
     block实现链式编程,写一个加法计算器
     */
//    [self blockTest03];
    
    /*
     block函数式编程,写一个计算器
     */
        [self blockTest08];
    
    /*
     循环引用
     */
//    [self blockTest04];
//    [self blockTest05];
    //    [self blockTest06];
//    [self blockTest07];
//    self.blockTest();
    
    /*
     NSTimer 内存泄漏
     */
//    [self timerTest01];
    
    
}

- (void)timerTest01{
    _target = [[NSObject alloc] init];
    class_addMethod([_target class], @selector(timerMethod), (IMP)targetMethod, "v@:");
    
    objc_setAssociatedObject(_target, key, self, OBJC_ASSOCIATION_ASSIGN);
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:_target selector:@selector(timerMethod) userInfo:nil repeats:YES];
}

void targetMethod(id objj, SEL _cmd){
    NSLog(@"1111111111");
//    WGBlockTestViewController *con = objc_getAssociatedObject(objj, key);
//    [con timerMethod];
}

//- (void)timerMethod{
//    WGLog(@"timerMethod");
//}

- (void)blockTest08{
    
    WGHanShuShiBlock *block = [[WGHanShuShiBlock alloc] init];
    int res = [block caculator:^int(int value) {
        value += 5;
        value -= 3;
        return value;
    }].result;
    NSLog(@"---->%d", res);
}

/*
 使用__weak，但是会有一个隐患，你不知道 self 什么时候会被释放，为了保证在block内不会被
 释放，我们添加__strong。更多的时候需要配合strongSelf使用
 注意:不会循环引用是因为strongSelf是在栈中的,局部变量,执行完就释放了
 不会循环引用
 */
- (void)blockTest07{
    __weak typeof(self) weakSelf = self;
    self.blockTest = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [strongSelf doSomething];
        });
    };
}

//不会循环引用
- (void)blockTest06{
    __weak WGBlockTestViewController *weakSelf = self;
    self.blockTest = ^{
        [weakSelf doSomething];
    };
}

//不会循环引用
- (void)blockTest05{
    __weak typeof(self) weakSelf = self;
    self.blockTest = ^{
        [weakSelf doSomething];
    };
}

/*
 block里用到self,则block会保持一个对self的引用,然而self也直接持有block属性,从而造成block和self的相互持有,在成循环引用
 会循环引用
 */
- (void)blockTest04{
    self.blockTest = ^{
        [self doSomething];
    };
}

//
- (void)blockTest03{
    WGLianShiBlock *wgBlock = [[WGLianShiBlock alloc] init];
    int res = wgBlock.add(10).add(20).add(30).result;
    WGLog(@"block实现链式编程加法结果%d",res);
}

//打印1
- (void)blockTest01{
    int blockTest01 = 1;
    void(^blk)(void) = ^{
        WGLog(@"blockTest01=%d\n",blockTest01);
    };
    blockTest01 = 2;
    blk();
}

//打印4
- (void)blockTest02{
    __block int blockTest02 = 3;
    void(^blk)(void) = ^{
        WGLog(@"blockTest02=%d\n",blockTest02);
    };
    blockTest02 = 4;
    blk();
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    WGBannerViewController *conv = [[WGBannerViewController alloc] init];
    [self.navigationController pushViewController:conv animated:YES];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)doSomething{
    WGLog(@"测试循环引用调用方法");
}

-(void)dealloc{
    WGLog(@"没有循环引用");
    [_timer invalidate];
    _timer = nil;
}

@end
