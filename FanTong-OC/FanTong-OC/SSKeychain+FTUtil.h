//
//  SSKeychain+FTUtil.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/14.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <SSKeychain/SSKeychain.h>

@interface SSKeychain (FTUtil)
+ (NSString *)rawLogin;
+ (NSString *)password;
+ (NSString *)accessToken;
+ (NSString *)secret;

+ (BOOL)setRawLogin:(NSString *)rawLogin;
+ (BOOL)setPassword:(NSString *)password;
+ (BOOL)setAccessToken:(NSString *)accessToken;
+ (BOOL)setSecret:(NSString *)secret;

+ (BOOL)deleteRawLogin;
+ (BOOL)deletePassword;
+ (BOOL)deleteAccessToken;
+ (BOOL)deleteSecret:(NSString *)secret;

@end
