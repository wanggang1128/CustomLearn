//
//  WGTextFieldViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/12/6.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGTextFieldViewController.h"
#import "UITextField+WGTextFieldRestrict.h"
#import "UITextField+WGtextFieldAdjust.h"

@interface WGTextFieldViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField01;
@property (nonatomic, strong) UITextField *textField02;
@property (nonatomic, strong) UITextField *textField03;

@end

@implementation WGTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
}

- (void)createView {
    
    self.title = @"WGTextFieldViewController";
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.textField01];
    [self.view addSubview:self.textField02];
    [self.view addSubview:self.textField03];
    
    _textField01.textFieldRestrict.textFieldChangedBlock = ^(NSString * _Nonnull textFieldStr) {
        
        if (textFieldStr.length == 2) {
            NSLog(@"---->%lu", (unsigned long)textFieldStr.length);
        }
    };
    _textField02.textFieldRestrict.textFieldChangedBlock = ^(NSString * _Nonnull textFieldStr) {
        
        if (textFieldStr.length == 2) {
            NSLog(@"---->%lu", (unsigned long)textFieldStr.length);
        }
    };
    _textField03.textFieldRestrict.textFieldChangedBlock = ^(NSString * _Nonnull textFieldStr) {
        
        if (textFieldStr.length == 2) {
            NSLog(@"---->%lu", (unsigned long)textFieldStr.length);
        }
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (UITextField *)textField01 {
    if (!_textField01) {
        UITextField *tempField = [[UITextField alloc] initWithFrame:CGRectMake(Margin, 100, SCREEN_WIDTH - Margin*2, 50)];
        tempField.placeholder = @"hello";
        tempField.delegate = self;
        tempField.borderStyle = UITextBorderStyleNone;
        tempField.backgroundColor = [UIColor whiteColor];
        tempField.keyboardType = UIKeyboardTypeDefault;
        tempField.layer.borderWidth = 0.68f;
        tempField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
        tempField.leftViewMode = UITextFieldViewModeAlways;
        tempField.textAlignment = NSTextAlignmentLeft;
        [[tempField layer] setBorderColor:[[UIColor colorWithRed:151.0/255.0f green:151.0/255.0f blue:151.0/255.0f alpha:1] CGColor]];
        
        tempField.textRestrictType = WGTextRestrictTypeNumber;
        _textField01 = tempField;
    }
    return _textField01;
}

- (UITextField *)textField02 {
    if (!_textField02) {
        UITextField *tempField = [[UITextField alloc] initWithFrame:CGRectMake(Margin, SCREEN_HEIGHT/2, SCREEN_WIDTH - Margin*2, 50)];
        tempField.placeholder = @"hello";
        tempField.delegate = self;
        tempField.borderStyle = UITextBorderStyleNone;
        tempField.backgroundColor = [UIColor whiteColor];
        tempField.keyboardType = UIKeyboardTypeDefault;
        tempField.layer.borderWidth = 0.68f;
        tempField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
        tempField.leftViewMode = UITextFieldViewModeAlways;
        tempField.textAlignment = NSTextAlignmentLeft;
        [[tempField layer] setBorderColor:[[UIColor colorWithRed:151.0/255.0f green:151.0/255.0f blue:151.0/255.0f alpha:1] CGColor]];
        
//        tempField.textRestrictType = WGTextRestrictTypeCharacter;
        [tempField setAutoAdjust:YES];
        tempField.maxLength = 5;
        _textField02 = tempField;
    }
    return _textField02;
}

- (UITextField *)textField03 {
    if (!_textField03) {
        UITextField *tempField = [[UITextField alloc] initWithFrame:CGRectMake(Margin, SCREEN_HEIGHT-200, SCREEN_WIDTH - Margin*2, 50)];
        tempField.placeholder = @"hello";
        tempField.delegate = self;
        tempField.borderStyle = UITextBorderStyleNone;
        tempField.backgroundColor = [UIColor whiteColor];
        tempField.keyboardType = UIKeyboardTypeDefault;
        tempField.layer.borderWidth = 0.68f;
        tempField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
        tempField.leftViewMode = UITextFieldViewModeAlways;
        tempField.textAlignment = NSTextAlignmentLeft;
        [[tempField layer] setBorderColor:[[UIColor colorWithRed:151.0/255.0f green:151.0/255.0f blue:151.0/255.0f alpha:1] CGColor]];
        
        tempField.textRestrictType = WGTextRestrictTypeDecimal;
        [tempField setAutoAdjust:YES];
        _textField03 = tempField;
    }
    return _textField03;
}

@end
