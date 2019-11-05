//
//  WGOneViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/1.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGOneViewController.h"
#import "WGMyHeadView.h"

@interface WGOneViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation WGOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)createView {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    WGMyHeadView *head = [[WGMyHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 184)];
    [self.view addSubview:head];
    
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.tableView];
}

#pragma mark -<UITableViewDelegate, UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    return cell;
}

-(UIView *)bgView {
    
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 143, SCREEN_WIDTH-20*2, SCREEN_HEIGHT-143-49)];
        _bgView.layer.shadowColor = UIColor.lightGrayColor.CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0, 0);
        _bgView.layer.shadowOpacity = 1;
        _bgView.clipsToBounds = NO;
        _bgView.layer.cornerRadius = 5;
    }
    return _bgView;
}

-(UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bgView.width, self.bgView.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = UIColor.whiteColor;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.layer.cornerRadius = 5;
    }
    return _tableView;
}

@end
