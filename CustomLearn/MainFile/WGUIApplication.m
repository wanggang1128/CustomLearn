//
//  WGUIApplication.m
//  CustomLearn
//
//  Created by wanggang on 2019/4/8.
//  Copyright © 2019 WG. All rights reserved.
//

#define WGMAXNOTOUCHTIME 2*60*60

#import "WGUIApplication.h"

@interface WGUIApplication(){
    
    NSTimer *timer;
}

- (void)resetTimer;

@end

@implementation WGUIApplication

-(void)sendEvent:(UIEvent *)event{
    
    [super sendEvent:event];
    
    if (!timer) {
        [self resetTimer];
    }
    
    NSSet *touches = [event allTouches];
    
    if (touches.count>0) {
        
        UITouchPhase phase = ((UITouch *)[touches anyObject]).phase;
        if (phase == UITouchPhaseBegan) {
            
            [self resetTimer];
        }
    }
}

- (void)resetTimer{
    if (timer) {
        [timer invalidate];
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:WGMAXNOTOUCHTIME target:self selector:@selector(freeTimerNotificate:) userInfo:nil repeats:NO];
}

- (void)freeTimerNotificate:(NSNotification *)noti{
    
    //在想要获得通知的地方注册这个通知就行了
    [[NSNotificationCenter defaultCenter] postNotificationName:@"startLoginOut" object:nil];
}

@end
