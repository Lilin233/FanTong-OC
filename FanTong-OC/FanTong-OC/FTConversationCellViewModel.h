//
//  FTConversationCellViewModel.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/27.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface FTConversationCellViewModel : FTViewModel

@property (nonatomic, strong)DirectMessage *dm;

@property (nonatomic, strong)User *sender;
@property (nonatomic, copy)NSString *text;

- (instancetype)initWitDirectMessageModel:(DirectMessage *)dm;
@end
