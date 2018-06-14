//
//  RefreashUiOnMainthread.m
//  CustomLearn
//
//  Created by wanggang on 2018/1/17.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "RefreashUiOnMainthread.h"
#import "NSObject+WGRunTimeDealloc.h"

@interface RefreashUiOnMainthread ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation RefreashUiOnMainthread

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    self.button.backgroundColor = [UIColor yellowColor];
    [self.button addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    NSObject *foo = [[NSObject alloc] init];
    [foo wg_tuntimeDealloc:^{
        NSLog(@"正在释放foo!");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClicked {
    [NSThread detachNewThreadSelector:@selector(uiRefreashTest) toTarget:self withObject:nil];
}

- (void)uiRefreashTest {
    NSLog(@"当前线程:%@", [NSThread currentThread]);
    NSLog(@"主线程:%@", [NSThread mainThread]);
    [self.button setTitle:@"ceshi" forState:UIControlStateNormal];
}







@end
