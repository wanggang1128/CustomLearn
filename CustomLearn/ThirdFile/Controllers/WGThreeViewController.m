//
//  WGThreeViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/1.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGThreeViewController.h"
#import "WGFriendInfoViewController.h"

@interface WGThreeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *WGThreeTableView;

@end

@implementation WGThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"333";    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.WGThreeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    //添加观察者KVO
    [self.WGThreeTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
   CGFloat alpha = MAX(0, self.WGThreeTableView.contentOffset.y / (SCREEN_WIDTH / 16.0f * 9.0f - 64));
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.6 green:0.1 blue:0.9 alpha:alpha]] forBarMetrics:UIBarMetricsDefault];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    WGFriendInfoViewController *friendIn = [[WGFriendInfoViewController alloc] init];
    [friendIn setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:friendIn animated:YES];
}

@end
