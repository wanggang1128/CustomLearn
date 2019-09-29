//
//  WGTabBarViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/1.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGTabBarViewController.h"
#import "WGOneViewController.h"
#import "WGTwoViewController.h"
#import "WGThreeViewController.h"
#import "WGFourViewController.h"

@interface WGTabBarViewController ()

@end

@implementation WGTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WGOneViewController *oneView = [[WGOneViewController alloc] init];
    WGTwoViewController *twoView = [[WGTwoViewController alloc] init];
    WGThreeViewController *threeView = [[WGThreeViewController alloc] init];
    WGFourViewController *fourView = [[WGFourViewController alloc] init];
    
    [self setViewControllers:@[[self viewController:oneView title:@"首页" nomalImg:@"test" tag:0],[self viewController:twoView title:@"我" nomalImg:@"test" tag:1],[self viewController:threeView title:@"详情" nomalImg:@"test" tag:2],[self viewController:fourView title:@"通讯" nomalImg:@"test" tag:3]]];
}

- (UINavigationController *)viewController:(UIViewController *)vc title:(NSString *)title nomalImg:(NSString *)imgStr tag:(NSInteger)tag{
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imgStr] tag:tag];
    item.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@",imgStr,@"s"]];
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColor.redColor, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBar appearance] setUnselectedItemTintColor:UIColor.grayColor];
    
    vc.tabBarItem = item;
    return nav;
}


















@end
