//
//  WGNSURLSessionViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/9/5.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGNSURLSessionViewController.h"
#define boundary @"AaB03x" //设置边界 参数可以随便设置
#define Enter @"\r\n"

@interface WGNSURLSessionViewController ()<NSURLSessionTaskDelegate,NSURLSessionDelegate>

@end

@implementation WGNSURLSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    [self sendLogin];
//    [self filePostTest];
//    [self downloadTest];
    
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)sendLogin{
    [[WGConnectionManager shareWGConnectionManager] loginWithUserName:@"18658114668" passWord:@"e10adc3949ba59abbe56e057f20f883e" deviceId:@"SPDBA001017" complete:^(WGRemoteResponse *remoteResponse) {
        if ([remoteResponse isSuccess]) {
            WGLog(@"登陆成功:%@,%@",[remoteResponse returnCode],[remoteResponse responseDic]);
        }else{
            WGLog(@"登录失败:%@,%@",[remoteResponse returnCode],[remoteResponse returnMsg]);
        }
    }];
}

#pragma mark get请求实验
- (void)getRequestTest{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://10.129.32.151:9092/mcim/login.do"]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        NSString *resStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"get请求返回数据data:%@,response:%@",resStr,res.allHeaderFields);
    }];
    [task resume];
}

#pragma mark 文件类post请求
- (void)filePostTest{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"gesture.png" ofType:nil];
    UIImage *image = [UIImage imageNamed:@"gesture.png"];
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    WGLog(@"path:%@",path);
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",TransactionUrl,UploadAllFile];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary *headDic = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"application/json", @"Content-Type",
                             nil];
    [request setAllHTTPHeaderFields:headDic];
    
//    NSString* headerString = [NSString stringWithFormat:@"multipart/form-data; charset=utf-8; boundary=%@",boundary];
//    [request setValue:headerString forHTTPHeaderField:@"Content-Type"];
    
//    NSMutableData *requestMutData = [NSMutableData data];
//    NSMutableString *bodyString = [NSMutableString stringWithFormat:@"--%@\r\n",boundary];
//    [bodyString appendString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"FilePath\"; filename=\"%@\"\r\n",path]];
//    [bodyString appendString:@"Content-Type: image/jpeg\r\n\r\n"];
//    [requestMutData appendData:[bodyString dataUsingEncoding:NSUTF8StringEncoding]];
    
//    WGLog(@"requestMutData00000:%@",[[NSString alloc] initWithData:requestMutData encoding:NSUTF8StringEncoding]);
    
    NSDictionary *parameter = [[NSDictionary alloc] initWithObjectsAndKeys:
                               path,@"FileName",
                               @"1",@"UploadType",
                               @"SPDBA001017",@"UserName",
                               @"SPDBA001017",@"username",
                               @"SPDBA001017",@"DeviceId",
                               @"image/jpeg",@"imageType",
                               nil];
    NSData *parameterData = [NSJSONSerialization dataWithJSONObject:parameter options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc] initWithData:parameterData encoding:NSUTF8StringEncoding];
//    [requestMutData appendData:parameterData];
//    
//    [requestMutData appendData:data];
//    [requestMutData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding] ];
    
    [request setHTTPBody:parameterData];
//    NSDictionary *dic= [NSJSONSerialization JSONObjectWithData:requestMutData options:NSJSONReadingMutableContainers error:nil];
//    NSString *str = [[NSString alloc] initWithData:requestMutData encoding:NSUTF8StringEncoding];
//    WGLog(@"requestMutData:%@",str);
//    WGLog(@"dic:%@",dic);
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionUploadTask *task = [session uploadTaskWithRequest:request fromData:parameterData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            WGLog(@"上传图片失败");
        }else{
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             WGLog(@"上传图片成功:%@",str);
        }
    }];
    [task resume];
}

#pragma mark 下载实验
- (void)downloadTest{
    NSString *urlStr = [NSString stringWithFormat:@"http://audio.xmcdn.com/group11/M01/93/AF/wKgDa1dzzJLBL0gCAPUzeJqK84Y539.m4a"];
    // 一些特殊字符编码
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            WGLog(@"下载失败：%@",error);
        }else{
            WGLog(@"下载成功:%@",location.path);
            NSString *path = [[WGGlobleMethod shareWGGlobleMethod] applicationDocumentDirectoryFile:@"111111"];
            NSError *fileError;
            [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:path error:&fileError];
            if (fileError == nil) {
                WGLog(@"file save success");
            } else {
                WGLog(@"file save error: %@",fileError);
            }
        }
    }];
    [task resume];
}














@end
