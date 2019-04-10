//
//  WGScrollViewTableViewViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/4/10.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGScrollViewTableViewViewController.h"
#import "WGScrollViewTableViewDetailViewController.h"
#import "WGSliderUIScrollView.h"

@interface WGScrollViewTableViewViewController ()<HuCusSagmentBtnViewDelegate, UIScrollViewDelegate>

//滑动按钮
@property (nonatomic, strong) HuCusSagmentBtnView *sagView;
//对应滑动按钮滚动视图
@property (nonatomic, strong) WGSliderUIScrollView *bgScroll;

@property (nonatomic, strong) WGScrollViewTableViewDetailViewController *one;
@property (nonatomic, strong) WGScrollViewTableViewDetailViewController *two;
@end

@implementation WGScrollViewTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sagView = [[HuCusSagmentBtnView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
    self.sagView.huCusSagmentBtnViewDelegate = self;
    self.sagView.dataArr = [NSArray arrayWithObjects:@"待完成计划",@"已完成计划", nil];
    self.sagView.tagTextColor_normal = [UIColor blackColor];
    self.sagView.tagTextFont_normal = 16;
    self.sagView.tagTextFont_selected = 16;
    self.sagView.sliderW = 70;
    self.sagView.sliderH = 1;
    [self.view addSubview:self.sagView];
    
    self.bgScroll = [[WGSliderUIScrollView alloc] initWithFrame:CGRectMake(_sagView.left, _sagView.bottom, _sagView.width, SCREEN_HEIGHT-_sagView.height-64)];
    self.bgScroll.delegate = self;
    self.bgScroll.contentSize = CGSizeMake(SCREEN_WIDTH*2, self.bgScroll.height);
    self.bgScroll.scrollEnabled = YES;
    _bgScroll.pagingEnabled = YES;
    [self.view addSubview:self.bgScroll];
    
    self.one = [[WGScrollViewTableViewDetailViewController alloc] init];
    _one.view.frame = CGRectMake(0, 0, _bgScroll.width, _bgScroll.height);
    _one.type = 0;
    
    self.two = [[WGScrollViewTableViewDetailViewController alloc] init];
    _one.view.frame = CGRectMake(SCREEN_WIDTH, 0, _bgScroll.width, _bgScroll.height);
    _two.type = 1;
    
    //执行[_bgScroll addSubview:_one.view]时,会执行one的tableview
    [_bgScroll addSubview:_one.view];
    [_bgScroll addSubview:_two.view];
    [self addChildViewController:_one];
    [self addChildViewController:_two];
}

#pragma mark -- taggedNavViewDelegate
-(void)didTapBtnWithIndex:(NSInteger)index{
    
    self.bgScroll.contentOffset = CGPointMake(SCREEN_WIDTH*index, 0);
}

#pragma mark -- scrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger selectedIndx = scrollView.contentOffset.x/SCREEN_WIDTH;
    [self.sagView slidBtnWithIndex:selectedIndx];
}


@end
