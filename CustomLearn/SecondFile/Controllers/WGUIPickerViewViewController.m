//
//  WGUIPickerViewViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/8/1.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGUIPickerViewViewController.h"

@interface WGUIPickerViewViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *foodsArr;
@property (nonatomic, strong) UILabel *fruitLab;
@property (nonatomic, strong) UILabel *stapleLab;
@property (nonatomic, strong) UILabel *drinkLab;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIButton *radomBtn;

@end

@implementation WGUIPickerViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self setViewView];
    for (NSInteger i = 0; i<self.foodsArr.count; i++) {
        [self pickerView:_pickerView didSelectRow:0 inComponent:i];
    }
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 250, SCREEN_WIDTH, SCREEN_HEIGHT-250)];
    subView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.pickerView];
    [self.view addSubview:self.radomBtn];
    [self.view addSubview:subView];
    [subView addSubview:self.fruitLab];
    [subView addSubview:self.stapleLab];
    [subView addSubview:self.drinkLab];
}

-(UILabel *)fruitLab{
    if (!_fruitLab) {
        _fruitLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH, 30)];
        [_fruitLab setFont:font18];
        [_fruitLab setTextColor:[UIColor redColor]];
    }
    return _fruitLab;
}

- (UILabel *)stapleLab{
    if (!_stapleLab) {
        _stapleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, SCREEN_WIDTH, 30)];
        [_stapleLab setFont:font18];
        [_stapleLab setTextColor:[UIColor greenColor]];
    }
    return _stapleLab;
}

- (UILabel *)drinkLab{
    if (!_drinkLab) {
        _drinkLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH, 30)];
        [_drinkLab setFont:font18];
        [_drinkLab setTextColor:[UIColor blueColor]];
    }
    return _drinkLab;
}

- (UIPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 100)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

- (UIButton *)radomBtn{
    if (!_radomBtn) {
        _radomBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
        [_radomBtn setTitle:@"随机" forState:UIControlStateNormal];
        [_radomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_radomBtn addTarget:self action:@selector(radomClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _radomBtn;
}

- (void)radomClick{
    //设置一个随机数
    for (int component=0; component<_foodsArr.count; component++) {
     //获取当前列对应的数据元素的个数
        NSInteger total=[_foodsArr[component] count];
        //根据每一列的总数生成随机数（当前生成的随机数）
        int randomNumber=arc4random()%total;
        //获取当前选中的行（上一次随机后移动到的行）
        NSInteger oldRow=[self.pickerView selectedRowInComponent:0];
        //比较上一次的行号和当前生成的随机数是否相同，如果相同的话则重新生成
        while (oldRow==randomNumber) {
            randomNumber=arc4random()%total;
        }
        //让pickerview滚动到指定的某一行
        [self.pickerView selectRow:randomNumber inComponent:component animated:YES];
        //模拟，通过代码选中某一行
        [self pickerView:_pickerView didSelectRow:randomNumber inComponent:component];
    }
}

- (NSMutableArray *)foodsArr{
    if (!_foodsArr) {
        NSArray *arrOne = [NSArray arrayWithObjects:@"西瓜",@"苹果",@"香蕉",@"橘子",@"榴莲",@"梨",@"葡萄",@"桃子", nil];
        NSArray *arrTwo = [NSArray arrayWithObjects:@"馒头",@"米饭",@"面条",@"窝窝头",@"油条",@"包子", nil];
        NSArray *arrThree = [NSArray arrayWithObjects:@"白开水",@"菊花茶",@"咖啡",@"苦瓜汁",@"铁观音",@"啤酒",@"六个核桃",@"营养快线",@"大麦茶", nil];
        _foodsArr = [NSMutableArray arrayWithObjects:arrOne,arrTwo,arrThree, nil];
    }
    return _foodsArr;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return _foodsArr.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_foodsArr[component] count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //1.获取当前的列
    NSArray *arayM= _foodsArr[component];
    //2.获取当前列对应的行的数据
    NSString *name=arayM[row];
    return name;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //获取对应列，对应行的数据
    NSString *name=_foodsArr[component][row];
    //赋值
    if (0==component){
        self.fruitLab.text = name;
    }else if(1==component){
        self.stapleLab.text = name;
    }else
        self.drinkLab.text = name;
}

@end
