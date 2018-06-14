//
//  WGBannerViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/7/26.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGBannerViewController.h"
#import "WGBanner.h"

@interface WGBannerViewController ()<WGBannerDelegate>

@property (nonatomic, strong) NSArray *arr;

@end

@implementation WGBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arr = [[NSArray alloc] initWithObjects:@"11111",@"22222",@"33333",@"44444",@"55555",@"66666", nil];
    
    [self setViewView];
    [self buildCycleView];
    [self buildLable];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)buildCycleView{
    NSMutableArray *imgarr = [[NSMutableArray alloc] init];
    for (NSInteger i = 1; i<7; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cycle_image%ld.png",(long)i]];
        [imgarr addObject:image];
    }
    
    WGBanner *bannerView = [[WGBanner alloc] initWithImages:imgarr frame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT*0.3)];
    bannerView.pageChangeTime = 2;
    bannerView.pageControlLocation = 1;
    bannerView.descriptionArr = _arr;
    bannerView.wgBannerDelegate = self;
    
    [self.view addSubview:bannerView];
}

- (void)buildLable{
    UILabel *huaL = [[UILabel alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT*0.5, SCREEN_WIDTH-60, 30)];
    huaL.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:huaL];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"这是一个实验轮播图"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(2, 4)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(6, 3)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30.0] range:NSMakeRange(0, 3)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25] range:NSMakeRange(3, 3)];
    [str addAttribute:NSFontAttributeName value:font18 range:NSMakeRange(6, 3)];
    huaL.attributedText = str;
    [huaL sizeToFit];
}

#pragma mark -图片点击代理
-(void)currentPageClick:(NSInteger)clickIndex{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[_arr objectAtIndex:clickIndex] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
}

@end
