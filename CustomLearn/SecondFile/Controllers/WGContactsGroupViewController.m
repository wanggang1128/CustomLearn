//
//  WGContactsGroupViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/8/7.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGContactsGroupViewController.h"

@interface WGContactsGroupViewController ()

@end

@implementation WGContactsGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    [self arrayText];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

//数组初始换实验
- (void)arrayText{
    NSArray *arrOne = [[NSArray alloc] init];
    NSLog(@"arrOne的地址:%p+++++",arrOne);
    arrOne = @[@"1"];
    NSArray *arrTwo = [[NSArray alloc] initWithArray:arrOne];
    NSLog(@"arrOne的地址:%p,----arrTwo的地址:%p",arrOne,arrTwo);
}












@end
