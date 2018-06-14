//
//  WGHTMLViewController.h
//  CustomLearn
//
//  Created by wanggang on 2017/10/19.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGUIViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol WGHTMLViewControllerDelegate <JSExport>
//tianbai对象调用的JavaScript方法，必须声明！！！
- (void)call;
- (void)getCall:(NSString *)callString;

@end

@interface WGHTMLViewController : WGUIViewController<UIWebViewDelegate,WGHTMLViewControllerDelegate>

@property (nonatomic, strong) JSContext *jsContext;
@property (nonatomic, strong) UIWebView *webView;

@end
