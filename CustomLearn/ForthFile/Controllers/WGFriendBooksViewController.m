//
//  WGFriendBooksViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/5.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGFriendBooksViewController.h"
#import "WGFriendInfoViewController.h"

@interface WGFriendBooksViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation WGFriendBooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self createTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //tableview滑到底部
    if (self.tableView.contentSize.height > self.tableView.frame.size.height){
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
        [self.tableView setContentOffset:offset animated:YES];
    }
}

- (void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell2"];
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"UITableViewCell2"];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%ldaaa",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WGFriendInfoViewController *friendIn = [[WGFriendInfoViewController alloc] init];
    [friendIn setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:friendIn animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.0001;
}

@end
