//
//  WGJSONModelViewController.m
//  CustomLearn
//
//  Created by wanggang on 2018/2/23.
//  Copyright © 2018年 CSII. All rights reserved.
//

/*参考：
https://www.cnblogs.com/MartinLi841538513/articles/3936952.html
https://www.jianshu.com/p/3cce56f374b4
*/

#import "WGJSONModelViewController.h"
#import "WGJsonmodel.h"
#import "JSONModelLib.h"

@interface WGJSONModelViewController ()
{
    WGJsonmodel *jmodel;
}

@end

@implementation WGJSONModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    [self requestData];
    
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)requestData{
    NSNumber *a = [NSNumber numberWithInt:29];
    NSNumber *b = [NSNumber numberWithInt:30];
    NSNumber *c = [NSNumber numberWithInt:31];
    NSMutableDictionary *dic02 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"222", @"order_id", @"zhangsan", @"name", a, @"products", nil];
    NSMutableDictionary *dic03 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"333", @"order_id", NULL, @"name", b, @"products", nil];
    NSMutableDictionary *dic04 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"444", @"order_id", @"wangwu", @"name", c, @"products", nil];
    
    NSMutableArray *arr01 = [NSMutableArray arrayWithObjects:dic02, dic03, dic04, nil];
    
    NSMutableDictionary *dic01 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"sears", @"source", @"123", @"agent", @"ios", @"client",arr01, @"categories", nil];
    
    WGLog(@"拼接的字典%@", dic01);
    
    NSString *jsonString = [[WGGlobleMethod shareWGGlobleMethod] dictionaryToJsonStr:dic01];
    WGLog(@"拼接的字典转字符串%@",jsonString);
    jmodel = [[WGJsonmodel alloc] initWithString:jsonString error:nil];
    WGLog(@"字符串转模型%@", jmodel);
}

@end
