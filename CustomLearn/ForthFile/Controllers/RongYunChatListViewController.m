//
//  RongYunChatListViewController.m
//  CustomLearn
//
//  Created by wanggang on 2017/6/26.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "RongYunChatListViewController.h"

@interface RongYunChatListViewController ()

@end

@implementation RongYunChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_PRIVATE),
                                          @(ConversationType_GROUP)]];
    [self.conversationListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = @"想显示的会话标题";
    [conversationVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:conversationVC animated:YES];
}
















@end
