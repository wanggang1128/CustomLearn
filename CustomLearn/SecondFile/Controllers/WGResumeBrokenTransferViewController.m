//
//  WGResumeBrokenTransferViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/8/29.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGResumeBrokenTransferViewController.h"
#import "WGDownloadManager.h"

@interface WGResumeBrokenTransferViewController ()

@property (nonatomic, strong)UIProgressView *progressView;

@end

@implementation WGResumeBrokenTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [startBtn setBackgroundColor:[UIColor yellowColor]];
    [startBtn addTarget:self action:@selector(startBtnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIButton *stopBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [stopBtn setTitle:@"暂停" forState:UIControlStateNormal];
    [stopBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [stopBtn setBackgroundColor:[UIColor yellowColor]];
    [stopBtn addTarget:self action:@selector(stopBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, 10)];
    [self.view addSubview:_progressView];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)startBtnclicked{
    [[WGDownloadManager shareWGDownloadManager] downloadWithUrl:@"http://audio.xmcdn.com/group11/M01/93/AF/wKgDa1dzzJLBL0gCAPUzeJqK84Y539.m4a" success:^(NSString *fileStorePath) {
        NSLog(@"success:%@",fileStorePath);
    } faile:^(NSError *error) {
        NSLog(@"faile:%@",error.userInfo[NSLocalizedDescriptionKey]);
    } process:^(float process) {
        _progressView.progress = process;
        NSLog(@"process:%f",process);
    }];
}

- (void)stopBtnClicked{
//    [[WGDownloadManager shareWGDownloadManager] stopTask];
    
    //试验一下APP之间的跳转
    
    // 1.获取应用程序App-B的URL Scheme
    NSURL *appBUrl = [NSURL URLWithString:@"AppB://Page1"];
    
    // 2.判断手机中是否安装了对应程序
    if ([[UIApplication sharedApplication] canOpenURL:appBUrl]) {
        // 3. 打开应用程序App-B
        [[UIApplication sharedApplication] openURL:appBUrl];
    } else {
        NSLog(@"没有安装");
    }
}

@end
