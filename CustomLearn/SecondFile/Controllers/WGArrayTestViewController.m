//
//  WGArrayTestViewController.m
//  CustomLearn
//
//  Created by wanggang on 2018/4/20.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "WGArrayTestViewController.h"

@interface WGArrayTestViewController ()

@end

@implementation WGArrayTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这里先不考虑属性，考虑局部变量
//    [self equalArr];
//    [self copyArr];
    [self mutcopyArr];
    
}

- (void)equalArr{
    NSMutableArray *one = [[NSMutableArray alloc] init];
    NSMutableArray *two = [[NSMutableArray alloc] init];
    
    WGLog(@"one地址:%p--1111equalArr--two地址:%p",one, two);
    
    [one addObject:@"1"];
    two = one;
    
    WGLog(@"one地址:%p--2222equalArr--two地址:%p",one, two);
    WGLog(@"one值:%@--2222equalArr--two值:%@",one, two);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [one addObject:@"2"];
        [two addObject:@"3"];
        WGLog(@"one地址:%p--3333equalArr--two地址:%p",one, two);
        WGLog(@"one值:%@--3333equalArr--two值:%@",one, two);
    });
}

- (void)copyArr{
    NSMutableArray *one = [[NSMutableArray alloc] init];
    NSMutableArray *two = [[NSMutableArray alloc] init];
    
    WGLog(@"one地址:%p--1111copyArr--two地址:%p",one, two);
    
    [one addObject:@"1"];
    [one addObject:@"4"];
    two = one.copy;
    
    WGLog(@"one地址:%p--2222copyArr--two地址:%p",one, two);
    WGLog(@"one值:%@--2222copyArr--two值:%@",one, two);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [one addObject:@"2"];
        WGLog(@"one地址:%p--3333copyArr--two地址:%p",one, two);
        WGLog(@"one值:%@--3333copyArr--two值:%@",one, two);
        [two addObject:@"3"];//这一句要崩溃
        WGLog(@"one地址:%p--4444copyArr--two地址:%p",one, two);
        WGLog(@"one值:%@--4444copyArr--two值:%@",one, two);
    });
}

- (void)mutcopyArr{
    NSMutableArray *one = [[NSMutableArray alloc] init];
    NSMutableArray *two = [[NSMutableArray alloc] init];
    
    WGLog(@"one地址:%p--1111mutcopyArr--two地址:%p",one, two);
    
    [one addObject:@"1"];
    two = one.mutableCopy;
    
    WGLog(@"one地址:%p--2222mutcopyArr--two地址:%p",one, two);
    WGLog(@"one值:%@--2222mutcopyArr--two值:%@",one, two);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [one addObject:@"2"];
        WGLog(@"one地址:%p--3333mutcopyArr--two地址:%p",one, two);
        WGLog(@"one值:%@--3333mutcopyArr--two值:%@",one, two);
        [two addObject:@"3"];//这一句就不会崩溃
        WGLog(@"one地址:%p--4444mutcopyArr--two地址:%p",one, two);
        WGLog(@"one值:%@--4444mutcopyArr--two值:%@",one, two);
    });
}


@end
