//
//  WGFourViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/5.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGFourViewController.h"
#import "WGChatIndexViewController.h"
#import "WGFriendBooksViewController.h"
#import "WGTeamKindsViewController.h"
#import "RongYunChatListViewController.h"

@interface WGFourViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UISegmentedControl *segment;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic,assign)NSInteger segmentIndex;
@property (nonatomic, strong)WGFriendBooksViewController *friendBooksView;
@property (nonatomic, strong)RongYunChatListViewController *RongyunView;
@property (nonatomic, strong)WGTeamKindsViewController *teamKindsView;

@end

@implementation WGFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createSegment];
    [self createScrollView];
}

- (void)createScrollView{

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT -64-49)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(3*SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    _scrollView.showsHorizontalScrollIndicator = NO;//取消水平方向线
    _scrollView.pagingEnabled = YES;//控件是否整页翻动
    _scrollView.bounces = NO;//取消反弹效果
    _scrollView.directionalLockEnabled = YES;//指定控件是否只能在一个方向上滚动
    [self.view addSubview:_scrollView];
    
    self.RongyunView = [[RongYunChatListViewController alloc] init];
    _RongyunView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    self.friendBooksView = [[WGFriendBooksViewController alloc] init];
    _friendBooksView.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    self.teamKindsView = [[WGTeamKindsViewController alloc] init];
    _teamKindsView.view.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
    [_scrollView addSubview:_RongyunView.view];
    [_scrollView addSubview:_friendBooksView.view];
    [_scrollView addSubview:_teamKindsView.view];
    [self addChildViewController:_RongyunView];
    [self addChildViewController:_friendBooksView];
    [self addChildViewController:_teamKindsView];
}

- (void)createSegment{
    
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"联系人",@"分组"]];
    _segmentIndex = 0;
    _segment.selectedSegmentIndex = _segmentIndex;
    _segment.tintColor = [UIColor blueColor];
    [_segment addTarget:self action:@selector(segmentClicked) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = _segment;
}

- (void)segmentClicked{
    
    _segmentIndex = _segment.selectedSegmentIndex;
    _scrollView.contentOffset = CGPointMake(_segmentIndex*SCREEN_WIDTH, 0);
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    _segmentIndex = scrollView.contentOffset.x/SCREEN_WIDTH;
    _segment.selectedSegmentIndex = _segmentIndex;
}






@end
