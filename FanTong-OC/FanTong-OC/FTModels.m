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

@implementation Status

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"status_id": @"id"};
}



@end

@implementation Photo


@end

@implementation User


+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"user_id": @"id",
             @"user_protected": @"protected",
             @"descriptions": @"description"};
}



@end