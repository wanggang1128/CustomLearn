//
//  AppDelegate.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/1.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "AppDelegate.h"
#import "WGTabBarViewController.h"
#import "WGLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    WGTabBarViewController *wgtab = [[WGTabBarViewController alloc] init];
    self.window.rootViewController = wgtab;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self setNav];
    
    [self rongyunChat];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startLoginOut) name:@"startLoginOut" object:nil];
    
    return YES;
}

- (void)startLoginOut{
    
    NSLog(@"------->登出");
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[WGLoginViewController alloc] init]];
    self.window.rootViewController = nav;
}

//小王，xiaowang， cw4PH5JrLRbSAa5AYp/kFHUa4a5jpDZ3I3o1nVmkpf3IJT3+3ek11lrf5QYP2zMRF3LdLKtDg3DkXtCt4lpj/KLlfWauJzs5
//小张，xiaozhang，H+orscL7FyyXkhIe0vZ4OABKvoyNDNACaQegNR+7b7w9xpDnqQqfrToH6WuY6PForT/mAP6LlAm2N3em8Z9zZ8fR1EUcA9FL
- (void)rongyunChat{
    [[RCIM sharedRCIM] initWithAppKey:@"vnroth0kvdoso"];
    [[RCIM sharedRCIM] connectWithToken:@"cw4PH5JrLRbSAa5AYp/kFHUa4a5jpDZ3I3o1nVmkpf3IJT3+3ek11lrf5QYP2zMRF3LdLKtDg3DkXtCt4lpj/KLlfWauJzs5" success:^(NSString *userId) {
        
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
}

- (void)setNav{
    
    //导航栏为白色
//    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
//    //改变导航栏的字体颜色和大小
//    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIColor blackColor], NSForegroundColorAttributeName,
//                                                          font18, NSFontAttributeName,
//                                                          nil]];
//    //状态栏颜色
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {

#if NT_COVERAGE
    
#if !TARGET_IPHONE_SIMULATOR
    
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    setenv("GCOV_PREFIX", [documentsDirectory cStringUsingEncoding:NSUTF8StringEncoding], 1);
    setenv("GCOV_PREFIX_STRIP", "13", 1);
    
#endif
    
    extern void __gcov_flush(void);
    
    __gcov_flush();
    
#endif
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
