//
//  WGLoginViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/4/8.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGLoginViewController.h"
#import "WGTabBarViewController.h"

@interface WGLoginViewController ()

@end

@implementation WGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    WGTabBarViewController *wgtab = [[WGTabBarViewController alloc] init];
    
    [UIApplication sharedApplication].delegate.window.rootViewController = wgtab;
}

@end
