//
//  WGChatIndexViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/5.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGChatIndexViewController.h"

@interface WGChatIndexViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation WGChatIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self createTableView];
}

- (void)createTableView{

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell1"];
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"UITableViewCell1"];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.0001;
}


@end
