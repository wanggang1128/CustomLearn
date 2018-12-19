//
//  WGCategoryTestViewController.m
//  CustomLearn
//
//  Created by wanggang on 2018/10/16.
//  Copyright © 2018 WG. All rights reserved.
//

#define IMAGE_1 @"http://img3.xiazaizhijia.com/walls/20170512/mid_df02527dc67fc04.jpg"


#import "WGCategoryTestViewController.h"
#import "NSArray+WGCommon.h"
#import "NSDictionary+WGCommon.h"

@interface WGCategoryTestViewController ()

@end

@implementation WGCategoryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    
    NSArray *arr = @[@"1",@"2",@"2",@"4"];
    NSString *str = [arr transToJSONString];
    
    NSDictionary *dic = @{@"key1":@"1",@"key2":@"2"};
    NSDictionary *dict = @{@"key3":@"3"};
    NSDictionary *d = [NSDictionary dictionaryByMerging:dic with:dict];
    WGLog(@"数组转成json%@\n%@\n%@", dic, dict, d);

    
    //sdwebimage代码解读
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imgView sd_setImageWithURL:[NSURL URLWithString:IMAGE_1]];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}






@end
