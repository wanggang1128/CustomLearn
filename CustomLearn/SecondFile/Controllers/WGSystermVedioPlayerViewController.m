//
//  WGSystermVedioPlayerViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/8/16.
//  Copyright © 2017年 CSII. All rights reserved.
//

/*
 1.这个是用系统MPMoviePlayerController
 2.MPMoviePlayerController继承于UIViewController，默认是全屏模式展示、弹出后自动播放、作为模态窗口展示时如果点击“Done”按钮会自动退出模态窗口等
*/

#import "WGSystermVedioPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface WGSystermVedioPlayerViewController ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@end

@implementation WGSystermVedioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    [self.moviePlayer play];
    [self addNotification];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    [self.moviePlayer stop];
}

- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (MPMoviePlayerController *)moviePlayer{
    if (!_moviePlayer) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"textvedio" ofType:@"m4v"];
        NSURL *playerUrl = [NSURL fileURLWithPath:path];
        _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:playerUrl];
        _moviePlayer.view.frame = self.view.bounds;
        _moviePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_moviePlayer.view];
    }
    return _moviePlayer;
}

- (void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mediaPlayerPlaybackStateChange:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mediaPlayerPlaybackFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (void)mediaPlayerPlaybackStateChange:(NSNotification *)noti{
    switch (self.moviePlayer.playbackState) {
        case MPMoviePlaybackStatePlaying:{
            NSLog(@"正在播放");
            break;
        }
        case MPMoviePlaybackStateStopped:{
            NSLog(@"停止播放");
            break;
        }
        case MPMoviePlaybackStatePaused:{
            NSLog(@"暂停播放");
            break;
        }
        default:{
            NSLog(@"播放状态为:%ld",self.moviePlayer.playbackState);
            break;
        }
    }
}

- (void)mediaPlayerPlaybackFinish:(NSNotification *)noti{
    NSLog(@"播放完成.%li",self.moviePlayer.playbackState);
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}









@end
