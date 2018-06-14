//
//  WGTeamKindsViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/27.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGTeamKindsViewController.h"

@interface WGTeamKindsViewController ()

@property (nonatomic, strong) UISegmentedControl *segment;

@end

@implementation WGTeamKindsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setViewInfo{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)createSegment{
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"分组一",@"分组二",@"分组三"]];
}

@end
