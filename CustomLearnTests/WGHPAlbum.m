//
//  WGHPAlbum.m
//  CustomLearnTests
//
//  Created by wanggang on 2019/7/16.
//  Copyright © 2019 WG. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseSetingConfig.h"
#import "WGUIViewController.h"
#import "UIImage+Addition.h"
#import "GlobleMacroConfig.h"
#import "TransactionNameConfig.h"
#import "WGSendGeneralRequest.h"
#import "WGConnectionManager.h"
#import "WGRemoteResponse.h"
#import "WGGlobleMethod.h"
#import "JSONModel.h"
#import "JSONModelLib.h"
#import "UIView+WGFrame.h"
#import "UIView+WGController.h"
#import "UIButton+WGBtnAlphaControll.h"

@interface WGHPAlbum : XCTestCase

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation WGHPAlbum

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testAbc{
    NSInteger a = 2;
    NSInteger b = 3;
    XCTAssertEqual(a, b, @"a b不相等");

//    NSString *str1 = @"123";
//    NSString *str2 = str1.mutableCopy;
//    XCTAssertEqual(str1, str2);
//    XCTAssertEqualObjects(str1, str2);
//
//    //在想要获得通知的地方注册这个通知就行了
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"startLoginOut" object:nil];
}

- (void)testAbb{

    XCTestExpectation *expect = [self expectationWithDescription:@"Status code: 200"];

    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?media=music&entity=song&term=abba"];

    [[self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            XCTFail(@"---->error:%@",error.localizedDescription);
        }else{
            NSInteger code = ((NSHTTPURLResponse*)response).statusCode;
            if (code == 200){
                [expect fulfill];
            }else{
                XCTFail(@"---->Status code:%ld",code);
            }
        }
        
        
    }] resume];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testAcc{
    
    XCTestExpectation *expect = [self expectationWithDescription:@"Status code: 200"];
    
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?media=music&entity=song&term=abba"];
    
    NSError *error;
    __block NSInteger code;
    
    [[self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        error = error;
        code = ((NSHTTPURLResponse *)response).statusCode;
        
        [expect fulfill];
        
    }] resume];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
    
    XCTAssertNil(error);
    XCTAssertEqual(code, 200);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
