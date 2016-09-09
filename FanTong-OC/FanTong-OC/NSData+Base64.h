//
//  NSData+Base64.h
//  FanTong
//
//  Created by liuk on 16/3/11.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;

@end
