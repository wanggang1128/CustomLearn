//
//  WGCustomKeyboardViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/7/28.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGCustomKeyboardViewController.h"

@interface WGCustomKeyboardViewController () {
    UIView *view;
}
@end

@implementation WGCustomKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    [self buildTextFeild];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)buildTextFeild{
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(10, 64, 300, 40)];
    textFiled.borderStyle = UITextBorderStyleRoundedRect;//背景色白色
    textFiled.tag = 100;
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 216)];
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"+",@"-"];
    CGFloat xSpace = (SCREEN_WIDTH-40*4)/5.0;
    CGFloat ySpace = (216-40*3)/4.0;
    for(int i=0;i<3;i++){
        for(int j=0;j<4;j++){
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(xSpace+j*(xSpace+40), ySpace+i*(ySpace+40), 40, 40) ;
            [button setTitle:[array objectAtIndex:i*4+j] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:30];
            [view addSubview:button];
        }
    }
    view.backgroundColor = [UIColor redColor];
    textFiled.inputView = view;
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 25)];
    accessoryView.backgroundColor = [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"收键盘1" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 70, 25);
    [button addTarget:self action:@selector(buttonClickTwo:) forControlEvents:UIControlEventTouchUpInside];
    [accessoryView addSubview:button];
    textFiled.inputAccessoryView = accessoryView;
    [self.view addSubview:textFiled];
}

- (void)buttonClickTwo:(UIButton *)button{
    for (UIView *view1 in self.view.subviews){
        if([view1 isMemberOfClass:[UITextField class]]){
            UITextField *tf = (UITextField *)view1;
            [tf resignFirstResponder];
        }
    }
}

- (void)buttonClick:(UIButton *)button{
    UITextField * textField = (UITextField *)[self.view viewWithTag:100];
    textField.text = [textField.text stringByAppendingString:button.titleLabel.text];
}

@end
