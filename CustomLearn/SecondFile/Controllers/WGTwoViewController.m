//
//  WGTwoViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/1.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGTwoViewController.h"
#import "WGGestureViewController.h"
#import "WGBannerViewController.h"
#import "WGCustomKeyboardViewController.h"
#import "WGUIPickerViewViewController.h"
#import "WGContactsGroupViewController.h"
#import "WGSystermVedioPlayerViewController.h"
#import "WGWebViewViewController.h"
#import "WGResumeBrokenTransferViewController.h"
#import "WGAnimationViewController.h"
#import "WGNSURLSessionViewController.h"
#import "WGHTMLViewController.h"
#import "RefreashUiOnMainthread.h"
#import "WGJSONModelViewController.h"
#import "WGAnimationStudyViewC.h"
#import "WGArrayTestViewController.h"
#import "WGBlockTestViewController.h"
#import "AFNetworking.h"
#import "WGCategoryTestViewController.h"
#import "WGAlgorithmViewController.h"


@interface WGTwoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *itemArr;

@end

@implementation WGTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewBaseInfo];
    [self createTableView];
    
}

- (void)setViewBaseInfo{
    self.navigationItem.title = @"长路漫漫";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = BACKGROUND_COLOR;
}

- (void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.textLabel.text = [self.itemArr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            WGGestureViewController *gestureC = [[WGGestureViewController alloc] init];
            [self pushNextController:gestureC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
            
        case 1:{
            WGBannerViewController *bannerC = [[WGBannerViewController alloc] init];
            [self pushNextController:bannerC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 2:{
            WGCustomKeyboardViewController *customKeyboardC = [[WGCustomKeyboardViewController alloc] init];
            [self pushNextController:customKeyboardC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 3:{
            WGUIPickerViewViewController *pickerView = [[WGUIPickerViewViewController alloc] init];
            [self pushNextController:pickerView title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 4:{
            WGContactsGroupViewController *contactsGroupC = [[WGContactsGroupViewController alloc] init];
            [self pushNextController:contactsGroupC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 5:{
            WGSystermVedioPlayerViewController *systemC = [[WGSystermVedioPlayerViewController alloc] init];
            [self pushNextController:systemC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 6:{
            WGWebViewViewController *webViewC = [[WGWebViewViewController alloc] init];
            [self pushNextController:webViewC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 7:{
            WGResumeBrokenTransferViewController *resumeBc = [[WGResumeBrokenTransferViewController alloc] init];
            [self pushNextController:resumeBc title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 8:{
            WGAnimationViewController *animationC = [[WGAnimationViewController alloc] init];
            [self pushNextController:animationC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 9:{
            WGNSURLSessionViewController *animationC = [[WGNSURLSessionViewController alloc] init];
            [self pushNextController:animationC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 10:{
            WGHTMLViewController *htmlC = [[WGHTMLViewController alloc] init];
            [self pushNextController:htmlC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 11:{
            RefreashUiOnMainthread *refreshVC = [[RefreashUiOnMainthread alloc] init];
            [self pushNextController:refreshVC title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 12:{
            WGJSONModelViewController *jsonM = [[WGJSONModelViewController alloc] init];
            [self pushNextController:jsonM title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 13:{
            WGAnimationStudyViewC *anivc = [[WGAnimationStudyViewC alloc] init];
            [self pushNextController:anivc title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 14:{
            WGArrayTestViewController *anivc = [[WGArrayTestViewController alloc] init];
            [self pushNextController:anivc title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }
        case 15:{
//            WGBlockTestViewController *anivc = [[WGBlockTestViewController alloc] init];
//            [self pushNextController:anivc title:[_itemArr objectAtIndex:indexPath.row]];
            [[WGControllerPush WGControllerPushShare] pushFromController:self toCon:@"WGBlockTestViewController"];
            break;
        }
        case 16:{
//            WGCategoryTestViewController *an = [[WGCategoryTestViewController alloc] init];
//            [self pushNextController:an title:[_itemArr objectAtIndex:indexPath.row]];
            [[WGControllerPush WGControllerPushShare] pushFromController:self toCon:@"WGCategoryTestViewController"];
            break;
        }case 17:{
            WGAlgorithmViewController *an = [[WGAlgorithmViewController alloc] init];
            [self pushNextController:an title:[_itemArr objectAtIndex:indexPath.row]];
            break;
        }case 18:{
            [[WGControllerPush WGControllerPushShare] pushFromController:self toCon:@"WGNSTimerTestViewController"];
            break;
        }case 19:{
            [[WGControllerPush WGControllerPushShare] pushFromController:self toCon:@"WGSnowAnimationViewController"];
            break;
        }
        default:
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

-(NSMutableArray *)itemArr{
    if (!_itemArr) {
        _itemArr = [NSMutableArray arrayWithObjects:@"手势",@"轮播图",@"自定义键盘",@"随机选餐",@"联系人分组",@"系统视频播放器",@"自定义浏览器",@"断点下载实验",@"动画实验",@"NSURLSession测试",@"HTML与OC的交互", @"UI验证", @"JSONModel使用", @"动画详解", @"=/copy/mutCopy对数组的影响", @"block学习", @"类别测试", @"常用算法", @"NSTimer准吗,怎么解决", @"雪花动画", nil];
    }
    return _itemArr;
}

//页面跳转
- (void)pushNextController:(WGUIViewController *)controller title:(NSString *)titleStr{
    controller.navigationItem.title = titleStr;
    [controller setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:controller animated:YES];
}







@end
