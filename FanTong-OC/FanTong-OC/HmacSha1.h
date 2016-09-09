//
//  HmacSha1.h
//  FanTong
//
//  Created by liuk on 16/3/11.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HmacSha1 : NSObject
+ (NSString *)caculateHmacSha1Base64:(NSString *)text key:(NSString *)secret;
+ (NSString *)hmacsha1Base64:(NSString *)key text:(NSString *)text;
+ (NSString *) hmacSha1:(NSString*)key text:(NSString*)text;

@end
