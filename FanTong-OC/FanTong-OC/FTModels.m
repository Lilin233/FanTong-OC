//
//  FTModels.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/14.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTModels.h"

@implementation FTModels

@end

/// Status
@implementation Status

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"status_id": @"id"};
}

//+ (NSString *)primaryKey{
//    return @"status_id";
//}

@end

/// 照片信息
@implementation Photo


@end

/// 用户
@implementation User

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"user_id": @"id",
             @"user_protected": @"protected",
             @"descriptions": @"description"};
}

+ (NSString *)primaryKey{
    return @"user_id";
}
@end

/// 私信

@implementation DirectMessage

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"directMessage_id": @"id"};
}

@end

@implementation ConversationList


@end