//
//  BaseSetingConfig.h
//  CustomLearn
//
//  Created by wanggang on 2017/6/1.
//  Copyright © 2017年 CSII. All rights reserved.
//

#ifndef BaseSetingConfig_h
#define BaseSetingConfig_h

#define STabbarBGColor [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1]
#define SUINavgitionBarColor [UIColor colorWithRed:15.4/255.0 green:14.2/255.0 blue:21.3/255.0 alpha:1]
#define STabbarColor [UIColor grayColor]
#define BASE_COLOR [UIColor colorWithRed:104/255.0 green:187/255.0 blue:30/255.0 alpha:1]
#define STabbarColor_S [UIColor colorWithRed:0/255.0 green:172.0/255.0 blue:253.0/255.0 alpha:1]
//背景色
#define BACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]

#define font18 [UIFont systemFontOfSize:18.0]
#define font17 [UIFont systemFontOfSize:17.0]
#define font16 [UIFont systemFontOfSize:16.0]
#define font15 [UIFont systemFontOfSize:15.0]
#define font14 [UIFont systemFontOfSize:14.0]
#define font13 [UIFont systemFontOfSize:13.0]
#define font12 [UIFont systemFontOfSize:12.0]
#define font11 [UIFont systemFontOfSize:11.0]
#define font10 [UIFont systemFontOfSize:10.0]
#define font9 [UIFont systemFontOfSize:9.0]
#define font8 [UIFont systemFontOfSize:8.0]
#define font7 [UIFont systemFontOfSize:7.0]
#define font6 [UIFont systemFontOfSize:6.0]
//是否是在手机上运行
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//设计分辨率(点)
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//取最大,防止屏幕旋转造成判断失效
#define SCREEN_MAX_LENGTH MAX(SCREEN_WIDTH, SCREEN_HEIGHT)
//取最小,防止屏幕旋转造成判断失效
#define SCREEN_MIN_LENGTH MIN(SCREEN_WIDTH, SCREEN_HEIGHT)
#define IS_IPHONE_35_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_40 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_47 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_55 (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)

//对自己弱引用
#define WS(weakSelf)  __weak typeof(self)weakSelf = self

#ifdef DEBUG
# define WGLog(format, ...) NSLog(format, ##__VA_ARGS__)
#else
# define WGLog(...)
#endif

#endif
