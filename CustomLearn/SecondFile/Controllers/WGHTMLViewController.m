//
//  WGHTMLViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/10/19.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGHTMLViewController.h"

@implementation WGHTMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    [self setWebView];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setWebView{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _webView.delegate = self;
    //从本地加载html文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"OC交互" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
}

#pragma mark webview代理
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // 设置javaScriptContext上下文
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //将tianbai对象指向自身
    self.jsContext[@"tianbai"] = self;
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        context.exception = exception;
        WGLog(@"异常信息：%@",exception);
    };
}

- (void)call{
    WGLog(@"call");
    // 之后在回调JavaScript的方法Callback把内容传出去
    JSValue *Callback = self.jsContext[@"Callback"];
    //传值给web端
    [Callback callWithArguments:@[@"唤起本地OC回调完成"]];
}

- (void)getCall:(NSString *)callString{
    WGLog(@"Get:%@", callString);
    // 成功回调JavaScript的方法Callback
    JSValue *Callback = self.jsContext[@"alerCallback"];
    [Callback callWithArguments:@[callString]];
    
    //或者
//    [self alert];
}

- (void)alert{
    // 直接添加提示框
    NSString *str = @"alert('OC添加JS提示成功')";
    [self.jsContext evaluateScript:str];
    
}

@end
