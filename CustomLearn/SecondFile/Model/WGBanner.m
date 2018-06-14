//
//  WGBanner.m
//  CustomLearn
//
//  Created by wanggang on 2017/7/26.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGBanner.h"

#define CC_CYCLEINDEX_CALCULATE(x,y) (x+y)%y  //计算循环索引

@interface WGBanner()<UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *middleImageView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIScrollView *containerView;
@property (nonatomic, strong) UILabel *descriptionLab;
@property (nonatomic, strong)NSTimer *timer;
@property NSInteger currentNumber;

@end

@implementation WGBanner

- (instancetype)initWithImages:(NSArray *)imagesArr frame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.frame = frame;
        _imagesArr = [NSArray arrayWithArray:imagesArr];
        _currentNumber = 0;
        
        [self setCycleView];
        [self setPageControl];
        [self setPageDescription];
        [self setCycleImageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewSelected:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setCycleView{
    _containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _containerView.contentSize = CGSizeMake(3*_containerView.frame.size.width, _containerView.frame.size.height);
    _containerView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _containerView.frame.size.width, _containerView.frame.size.height)];
    _middleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_containerView.frame.size.width, 0  , _containerView.frame.size.width, _containerView.frame.size.height)];
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2*_containerView.frame.size.width, 0, _containerView.frame.size.width, _containerView.frame.size.height)];
    
    _containerView.delegate = self;
    [_containerView addSubview:_leftImageView];
    [_containerView addSubview:_rightImageView];
    [_containerView addSubview:_middleImageView];
    _containerView.scrollEnabled = YES;
    _containerView.showsHorizontalScrollIndicator = NO;
    _containerView.showsVerticalScrollIndicator = NO;
    _containerView.pagingEnabled = YES;
    
    [self addSubview:_containerView];
}

- (void)setPageControl{
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = _imagesArr.count;
    [self setPageControlLoca:_pageControlLocation];
    [self addSubview:_pageControl];
}

- (void)setPageDescription{
    _descriptionLab = [[UILabel alloc] initWithFrame:CGRectMake(0,_pageControl.frame.origin.y -10, self.frame.size.width, 40)];
    [_descriptionLab setTextColor:[UIColor yellowColor]];
    [_descriptionLab setFont:font14];
    [_descriptionLab setTextAlignment:NSTextAlignmentRight];
    _descriptionLab.backgroundColor = [UIColor clearColor];
    [self addSubview:_descriptionLab];
    
}

- (void)setCycleImageView{
    if (!_imagesArr || _imagesArr.count == 0) {
        return;
    }
    [self reloadImage];
    [self setTimerAction];
}

- (void)reloadImage{
    _leftImageView.image = _imagesArr[CC_CYCLEINDEX_CALCULATE(_currentNumber-1, _imagesArr.count)];
    _middleImageView.image = _imagesArr[CC_CYCLEINDEX_CALCULATE(_currentNumber, _imagesArr.count)];
    _rightImageView.image = _imagesArr[CC_CYCLEINDEX_CALCULATE(_currentNumber+1, _imagesArr.count)];
}

- (void)setTimerAction{
    //将定时器放入主线程runloop中
    self.timer = [NSTimer timerWithTimeInterval:self.pageChangeTime target:self selector:@selector(timeChanged) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timeChanged{
    if (!_imagesArr || _imagesArr.count == 0) {
        return;
    }
    _currentNumber = CC_CYCLEINDEX_CALCULATE(_currentNumber+1, _imagesArr.count);
    _pageControl.currentPage = _currentNumber;
    [self setDescriptionText];
    [self reloadImage];
    self.containerView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
}

- (void)setDescriptionText{
    _descriptionLab.text = _descriptionArr[_currentNumber];
    [_descriptionLab sizeToFit];
}

- (void)setPageControlLoca:(WGScrollPageViewPosition)position{
    switch (position) {
        case 0:{
            _pageControl.frame = CGRectMake(30, self.frame.size.height -30, 100, 30);
        }
            break;
        case 1:{
            _pageControl.frame = CGRectMake(self.center.x - 50, self.frame.size.height -30, 100, 30);
        }
            break;
        case 2:{
            _pageControl.frame = CGRectMake(self.frame.size.width - 100-30, self.frame.size.height -30, 100, 30);
        }
            break;
            
        default:
            break;
    }
}

//当用户手动个轮播时 关闭定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
}

//当用户手指停止滑动图片时 启动定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self setTimerAction];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = [self.containerView contentOffset];
    if (offset.x > SCREEN_WIDTH) {
        //向左滑
        self.currentNumber = CC_CYCLEINDEX_CALCULATE(_currentNumber  + 1,_imagesArr.count);
    }else {
        //向右滑
        self.currentNumber = CC_CYCLEINDEX_CALCULATE(_currentNumber  - 1,_imagesArr.count);
    }
    self.pageControl.currentPage = self.currentNumber;
    [self setDescriptionText];
    [self reloadImage];
    self.containerView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
}

#pragma mark -@property  set
-(void)setPageControlLocation:(WGScrollPageViewPosition)pageControlLocation{
    [self setPageControlLoca:pageControlLocation];
}

- (void)setDescriptionArr:(NSArray *)descriptionArr{
    _descriptionArr = [[NSArray alloc] initWithArray:descriptionArr];
    [self setDescriptionText];
}

-(void)setPageChangeTime:(NSTimeInterval)pageChangeTime{
    _pageChangeTime = pageChangeTime;
    [self.timer invalidate];
    [self setTimerAction];
}

#pragma mark -点击图片手势
- (void)imageViewSelected:(UITapGestureRecognizer *)tap{
    if (self.wgBannerDelegate && [self.wgBannerDelegate respondsToSelector:@selector(currentPageClick:)]) {
        [self.wgBannerDelegate currentPageClick:_currentNumber];
    }
}

@end
