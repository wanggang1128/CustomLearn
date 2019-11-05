//
//  WGMyDViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/10/12.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGMyDViewController.h"
#import "WGMinesweeperWarningView.h"

@interface WGMyDViewController ()

@property (nonatomic, strong) WGMinesweeperWarningView *warningView;

@end

@implementation WGMyDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
    
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets safeEdget01 = [self additionalSafeAreaInsets];
        UIEdgeInsets safeEdget02 = self.view.safeAreaInsets;
        UIEdgeInsets safeEdget03 = [[UIApplication sharedApplication] delegate].window.safeAreaInsets;
        
    } else {
        // Fallback on earlier versions
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)createView {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.warningView = [[WGMinesweeperWarningView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 30)];
    [self.view addSubview:self.warningView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    static NSInteger i = 0;
    self.warningView.importance = i%4;
    i++;
}

@end
