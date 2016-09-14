//
//  SSKeychain+FTUtil.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/14.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "SSKeychain+FTUtil.h"

@implementation SSKeychain (FTUtil)
+ (NSString *)rawLogin{
    return [[NSUserDefaults standardUserDefaults] objectForKey:FT_RAW_LOGIN];
}

+ (NSString *)password{
    return [self passwordForService:FT_SERVICE_NAME account:FT_PASSWORD];
}

+ (NSString *)accessToken{
    return [self passwordForService:FT_SERVICE_NAME account:FT_ACCESS_TOKEN];
}

+(NSString *)secret{
    return [self passwordForService:FT_SERVICE_NAME account:FT_SECRET];
}

+ (BOOL)setRawLogin:(NSString *)rawLogin{
    [[NSUserDefaults standardUserDefaults] setObject:rawLogin forKey:FT_RAW_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

+ (BOOL)setPassword:(NSString *)password{
    return  [self setPassword:password forService:FT_SERVICE_NAME account:FT_PASSWORD];
}

+ (BOOL)setAccessToken:(NSString *)accessToken{
    return [self setPassword:accessToken forService:FT_SERVICE_NAME account:FT_ACCESS_TOKEN];
}

+ (BOOL)setSecret:(NSString *)secret{
    return [self setPassword:secret forService:FT_SERVICE_NAME account:FT_SECRET];
}
//
//+ (BOOL)deleteRawLogin;
//+ (BOOL)deletePassword;
//+ (BOOL)deleteAccessToken;
//

@end
