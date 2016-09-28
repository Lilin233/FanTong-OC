//
//  FTDirectMessageCellViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/26.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTDirectMessageCellViewModel.h"
#import "FTAppBean.h"
@implementation FTDirectMessageCellViewModel

- (instancetype)initWitDirectMessageModel:(ConversationList *)listModel{
    self = [super init];
    if (self) {
        if (listModel.dm && listModel.dm != _dm) {
            _dm = listModel.dm;

            User *user = nil;
            if ([_dm.recipient.name isEqualToString:[FTAppBean shareInstance].loginUser.name]) {
                user = _dm.sender;
            }else{
                user = _dm.recipient;
            }
            
            _senderName  = user.name;
            _senderAvatarURL = [NSURL URLWithString:user.profile_image_url];
            _directMessageLastContent = _dm.text;
            _createDate = [_dm.created_at formatterStatusTime];
            _otherid = listModel.otherid;
            self.height = 60;
            
        }
        

    }
    return self;
}

@end
