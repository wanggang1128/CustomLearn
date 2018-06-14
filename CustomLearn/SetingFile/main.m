//
//  main.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/1.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @try {
        @autoreleasepool {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    }@catch (NSException *exception) {
        NSLog ( @"Stack Trace: %@" , [exception callStackSymbols ]);
    }
}
