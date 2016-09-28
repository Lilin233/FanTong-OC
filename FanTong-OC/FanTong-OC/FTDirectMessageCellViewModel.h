//
//  FTDirectMessageCellViewModel.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/26.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTViewModel.h"
@interface FTDirectMessageCellViewModel :FTViewModel
@property (nonatomic, copy)NSString *senderName;
@property (nonatomic, strong)NSURL *senderAvatarURL;
@property (nonatomic, copy)NSString *createDate;
@property (nonatomic, copy)NSString * directMessageLastContent;
@property (nonatomic, strong)DirectMessage *dm;
@property (nonatomic, copy)NSString *otherid;
- (instancetype)initWitDirectMessageModel:(ConversationList *)listModel;
@end
