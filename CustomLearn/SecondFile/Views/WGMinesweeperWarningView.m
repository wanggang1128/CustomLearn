//
//  WGMinesweeperWarningView.m
//  CustomLearn
//
//  Created by wanggang on 2019/11/1.
//  Copyright © 2019 WG. All rights reserved.
//

#define starWidth 14
#define starHeight 14
#define starViewHeight 14
#define starViewWidth (4*2+starWidth*3)
#define starCount 3
#define starImgViewStarTag 100

#import "WGMinesweeperWarningView.h"

@interface WGMinesweeperWarningView()

//左侧图标
@property (nonatomic, strong) UIImageView *leftImgView;
//扫雷预警
@property (nonatomic, strong) UILabel *warningLab;
//风险等级
@property (nonatomic, strong) UILabel *riskLab;
//⭐️的容器视图
@property (nonatomic, strong) UIView *starView;
//向右箭头
@property (nonatomic, strong) UIButton *arrowBtn;
//⭐️数组
@property (nonatomic, strong) NSMutableArray *starImgArr;

@end


@implementation WGMinesweeperWarningView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =  [UIColor colorWithRed:255/255.0 green:247/255.0 blue:231/255.0 alpha:1/1.0];
        [self createView];
    }
    return self;
}

- (void)createView {
    
    [self addSubview:self.leftImgView];
    [self addSubview:self.warningLab];
    [self addSubview:self.arrowBtn];
    [self addSubview:self.starView];
    [self addSubview:self.riskLab];
    
    [self.starImgArr removeAllObjects];
    
    for (NSInteger i = 0; i < starCount; i++) {
        
        CGFloat margin = 4;
        CGFloat x = (margin + starWidth) * (i % starCount);
        CGFloat y = 0;
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(x, y, starWidth, starHeight);
        imgView.image = [UIImage imageNamed:@"dart_image"];
        imgView.tag = starImgViewStarTag + i;
        
        [self.starView addSubview:imgView];
        [self.starImgArr addObject:imgView];
    }
}

- (void)setImportance:(NSInteger)importance {
    
    if (_importance != importance) {
        _importance = importance;
    }
    
    [self layoutStarView:importance];
}

- (void)layoutStarView:(NSInteger)count {
    
    if (self.starImgArr.count < count) {
        return;
    }
    NSArray *lightArr = [self.starImgArr subarrayWithRange:NSMakeRange(0, count)];
    NSArray *dartArr = [self.starImgArr subarrayWithRange:NSMakeRange(count, (self.starImgArr.count-count))];
    
    for (UIImageView *star in lightArr) {
        star.image = [UIImage imageNamed:@"light_image"];
    }
    
    for (UIImageView *star in dartArr) {
        star.image = [UIImage imageNamed:@"dart_image"];
    }
}

#pragma mark -懒加载
- (UIImageView *)leftImgView {
    
    if (!_leftImgView) {
        _leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(16, (self.height-20)/2, 20, 20)];
        _leftImgView.image = [UIImage imageNamed:@"warning_image"];
    }
    return _leftImgView;
}

- (UILabel *)warningLab {
    
    if (!_warningLab) {
        _warningLab = [[UILabel alloc] initWithFrame:CGRectMake(self.leftImgView.right+10, (self.height-14)/2, 80, 14)];
        _warningLab.text = @"扫雷预警";
        _warningLab.textColor =  [UIColor colorWithRed:247/255.0 green:127/255.0 blue:79/255.0 alpha:1/1.0];
    }
    return _warningLab;
}

- (UIButton *)arrowBtn {
    
    if (!_arrowBtn) {
        _arrowBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.width-16.5-6.5, (self.height-10)/2, 6.5, 10)];
        [_arrowBtn setImage:[UIImage imageNamed:@"more_image"] forState:UIControlStateNormal];
    }
    return _arrowBtn;
}

- (UIView *)starView {
    
    if (!_starView) {
        _starView = [[UIView alloc] initWithFrame:CGRectMake(self.arrowBtn.left-12-starViewWidth, (self.height-starViewHeight)/2, starViewWidth, starViewWidth)];
    }
    return _starView;
}

- (UILabel *)riskLab {
    
    if (!_riskLab) {
        _riskLab = [[UILabel alloc] initWithFrame:CGRectMake(self.starView.left-10-76, (self.height-18)/2, 76, 18)];
        _riskLab.layer.cornerRadius = 5;
        _riskLab.layer.masksToBounds = YES;
        _riskLab.backgroundColor =  [UIColor colorWithRed:247/255.0 green:87/255.0 blue:81/255.0 alpha:1/1.0];
        _riskLab.text = @"风险等级";
        _riskLab.textAlignment = NSTextAlignmentCenter;
        _riskLab.textColor =  [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];;
    }
    return _riskLab;
}

- (NSMutableArray *)starImgArr {
    
    if (!_starImgArr) {
        _starImgArr = [[NSMutableArray alloc] init];
    }
    return _starImgArr;
}

@end
