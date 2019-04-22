//
//  WGBtnAlphaControlViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/4/19.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGBtnAlphaControlViewController.h"

@interface WGBtnAlphaControlViewController ()

@end

@implementation WGBtnAlphaControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"按钮图文混排";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btnTop = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 70, 70)];
    [btnTop setTitle:@"上边" forState:UIControlStateNormal];
    [btnTop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnTop setImage:[UIImage imageNamed:@"btnAlphaControl"] forState:UIControlStateNormal];
    btnTop.titleLabel.font = [UIFont systemFontOfSize:20];
    [btnTop titlePosition:UIViewContentModeTop space:10];
    [btnTop setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:btnTop];
    
    UIButton *btnBottom = [[UIButton alloc] initWithFrame:CGRectMake(btnTop.right+10, btnTop.top, 70, 70)];
    [btnBottom setTitle:@"下边" forState:UIControlStateNormal];
    [btnBottom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnBottom setImage:[UIImage imageNamed:@"btnAlphaControl"] forState:UIControlStateNormal];
    btnBottom.titleLabel.font = [UIFont systemFontOfSize:20];
    [btnBottom titlePosition:UIViewContentModeBottom space:10];
    [btnBottom setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:btnBottom];
    
    UIButton *btnLeft = [[UIButton alloc] initWithFrame:CGRectMake(50, btnTop.bottom+100, 70, 30)];
    [btnLeft setTitle:@"左边" forState:UIControlStateNormal];
    [btnLeft setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnLeft setImage:[UIImage imageNamed:@"btnAlphaControl"] forState:UIControlStateNormal];
    btnLeft.titleLabel.font = [UIFont systemFontOfSize:20];
    [btnLeft titlePosition:UIViewContentModeLeft space:10];
    [btnLeft setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:btnLeft];
    
    UIButton *btnRight = [[UIButton alloc] initWithFrame:CGRectMake(50, btnLeft.bottom+100, 70, 30)];
    [btnRight setTitle:@"右边" forState:UIControlStateNormal];
    [btnRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnRight setImage:[UIImage imageNamed:@"btnAlphaControl"] forState:UIControlStateNormal];
    btnRight.titleLabel.font = [UIFont systemFontOfSize:20];
    [btnRight titlePosition:UIViewContentModeRight space:10];
    [btnRight setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:btnRight];
}



@end
