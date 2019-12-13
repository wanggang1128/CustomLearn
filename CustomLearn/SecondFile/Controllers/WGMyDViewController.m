//
//  WGMyDViewController.m
//  CustomLearn
//
//  Created by wanggang on 2019/10/12.
//  Copyright © 2019 WG. All rights reserved.
//

#import "WGMyDViewController.h"
#import "WGMinesweeperWarningView.h"

#import <objc/runtime.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

#import "WGAnimationView.h"


@interface WGMyDViewController ()

@property (nonatomic, strong) WGMinesweeperWarningView *warningView;

@property (nonatomic, assign)long long int lastBytes;
@property (nonatomic, assign)BOOL isFirstRate;

@property (nonatomic, strong) UILabel *rateLabel;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation WGMyDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
    
//    [self timerTest];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
    self.timer = nil;
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)createView {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIEdgeInsets insets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        insets = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;
    }
//
//    self.rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, insets.top+44, SCREEN_WIDTH, 40)];
//    _rateLabel.textColor = [UIColor redColor];
//    _rateLabel.backgroundColor = UIColor.yellowColor;
//    [self.view addSubview:_rateLabel];
    
    
    WGAnimationView *aniView = [[WGAnimationView alloc] initWithFrame:CGRectMake(0, insets.top+44, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:aniView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)timerTest{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
}

- (void)timerMethod{
    
    [self getInternetface];
}

- (void)getInternetface {
    
    long long int rate = 0;
    long long int currentBytes = [self getInterfaceBytes];
    
    if(self.lastBytes) {
        
        //用上当前的下行总流量减去上一秒的下行流量达到下行速录
        rate = currentBytes -self.lastBytes;
    }else{
        self.isFirstRate=NO;
    }
    //保存上一秒的下行总流量
    self.lastBytes= [self getInterfaceBytes];
    //格式化一下
    NSString*rateStr = [self formatNetWork:rate];
    NSLog(@"当前网速%@",rateStr);
    _rateLabel.text = rateStr;
}

- (long long) getInterfaceBytes {
    
    struct ifaddrs *ifa_list = 0, *ifa;
    if (getifaddrs(&ifa_list) == -1) {
        return 0;
    }
    uint32_t iBytes = 0;//下行
    uint32_t oBytes = 0;//上行
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next) {
        if (AF_LINK != ifa->ifa_addr->sa_family)
            continue;
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
            continue;
        if (ifa->ifa_data == 0)
            continue;
        /* Not a loopback device. */
        if (strncmp(ifa->ifa_name, "lo", 2)) {
            
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            iBytes += if_data->ifi_ibytes;
            oBytes += if_data->ifi_obytes;
        }
    }
    freeifaddrs(ifa_list);
    NSLog(@"\n[getInterfaceBytes-Total]%d,%d",iBytes,oBytes);
    
    return iBytes;
}

- (NSString*)formatNetWork:(long long int)rate {
    
    if(rate <1024) {
        return[NSString stringWithFormat:@"%lldB/秒", rate];
        
    }else if(rate >=1024&& rate <1024*1024) {
        return[NSString stringWithFormat:@"%.1fKB/秒", (double)rate /1024];
        
    }else if(rate >=1024*1024 && rate <1024*1024*1024){
        return[NSString stringWithFormat:@"%.2fMB/秒", (double)rate / (1024*1024)];
    }else{
        return@"10Kb/秒";
    };
}

@end
