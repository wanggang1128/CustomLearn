//
//  WGWebViewViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/8/16.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGWebViewViewController.h"

@interface WGWebViewViewController ()<UISearchBarDelegate,UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation WGWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    [self setUIView];
    [self loadRequest:@"http://www.baidu.com"];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setUIView{
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 44)];
    _searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64+44, SCREEN_WIDTH, SCREEN_HEIGHT-64-44-44)];
    _webView.delegate = self;
    _webView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.webView];
    
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, SCREEN_HEIGHT-44, 44, 44)];
    [_leftBtn addTarget:self action:@selector(gobackClick:) forControlEvents:UIControlEventTouchUpInside];
    [_leftBtn setTitle:@"<--" forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-59, SCREEN_HEIGHT-44, 44, 44)];
    [_rightBtn addTarget:self action:@selector(goforwardClick:) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn setTitle:@"-->" forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_leftBtn];
    [self.view addSubview:_rightBtn];
}

- (void)gobackClick:(UIButton *)sender{
    [_webView goBack];
}

- (void)goforwardClick:(UIButton *)sender{
    [_webView goForward];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    [self loadRequest:searchBar.text];
}

- (void)loadRequest:(NSString *)requestStr{
    
    NSString *urlStr = requestStr;
    if (![requestStr hasPrefix:@"http://"] && ![requestStr hasPrefix:@"https://"]) {
       urlStr = [NSString stringWithFormat:@"http://m.baidu.com/s?word=%@",requestStr];
    }
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_leftBtn setTitleColor:_webView.canGoBack?[UIColor blackColor]:[UIColor grayColor] forState:UIControlStateNormal];
    [_rightBtn setTitleColor:_webView.canGoForward?[UIColor blackColor]:[UIColor grayColor] forState:UIControlStateNormal];
}

@end
