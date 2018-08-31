//
//  RefreashUiOnMainthread.m
//  CustomLearn
//
//  Created by wanggang on 2018/1/17.
//  Copyright © 2018年 CSII. All rights reserved.
//

#import "RefreashUiOnMainthread.h"
#import "NSObject+WGRunTimeDealloc.h"

@interface RefreashUiOnMainthread ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation RefreashUiOnMainthread

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    [self.view addSubview:self.button];
    
    NSObject *foo = [[NSObject alloc] init];
    [foo wg_tuntimeDealloc:^{
        NSLog(@"正在释放foo!");
    }];
    
    //MBProgressHUD一定要回到主线程消失
//    [self MBProgressHUDText];
}

- (void)MBProgressHUDText{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"正在加载";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        WGLog(@"000000");
        sleep(5);
        WGLog(@"111111");
        [hud hideAnimated:YES];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            WGLog(@"555555");
//        });
        WGLog(@"222222");
        sleep(5);
        WGLog(@"333333");
    });
    WGLog(@"444444");
}

- (void)btnClicked {
    [NSThread detachNewThreadSelector:@selector(uiRefreashTest) toTarget:self withObject:nil];
}

- (void)uiRefreashTest {
    NSLog(@"当前线程:%@", [NSThread currentThread]);
    NSLog(@"主线程:%@", [NSThread mainThread]);
    
    //在子线程刷新该按钮的标题名字为子线程信息
    NSString *subStr = [NSString stringWithFormat:@"子线程:%@", [NSThread currentThread]];
    NSString *mainStr = [NSString stringWithFormat:@"主线程:%@", [NSThread mainThread]];
    [_button setTitle:subStr forState:UIControlStateNormal];
    CGRect labelTitleSize = [subStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
    _button.frame = CGRectMake(0, 100, labelTitleSize.size.width+10, labelTitleSize.size.height+10);
    
    //在子线程新建一个按钮,标题名字为主线程信息
    UIButton *newBtn = [[UIButton alloc] init];
    newBtn.backgroundColor = [UIColor greenColor];
    newBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    newBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [newBtn setTitle:subStr forState:UIControlStateNormal];
    [newBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    CGRect labelTitleSize01 = [subStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
    
    newBtn.frame = CGRectMake(0, 250, labelTitleSize01.size.width+10, labelTitleSize01.size.height+10);
    [self.view addSubview:newBtn];
    
    //在这个子线程延迟5秒钟
    sleep(5);
}

-(UIButton *)button{
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 100)];
        _button.backgroundColor = [UIColor yellowColor];
        [_button addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        [_button setTitle:@"UI" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _button.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _button;
}





@end
