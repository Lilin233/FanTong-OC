//
//  NSString+Ext.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/12.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "NSString+Ext.h"
#import <CoreFoundation/CFLocale.h>
@implementation NSString (Ext)
- (NSAttributedString *)formatterHTMLAttributeString{
    NSDictionary *optionDictionary = @{DTDefaultLinkColor: HTML_LINK_COLOR,
                                       DTDefaultLinkHighlightColor: HTML_LINK_COLOR,
                                       DTDefaultLinkDecoration: @(NO),
                                       DTDefaultLineHeightMultiplier: @(1.5)};
    NSAttributedString* attributedString = [[NSAttributedString alloc] initWithHTMLData:[self dataUsingEncoding:NSUnicodeStringEncoding] options:optionDictionary documentAttributes:nil];
    NSMutableAttributedString *mutableAttributedString = [attributedString mutableCopy];
    [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(0, mutableAttributedString.length)];
    return [mutableAttributedString copy];
}

- (NSString *)formatterStatusTime{
    //一小时以内 显示 xx分钟以前
    //时间为当天 显示为 xx小时以前
    //昨天发的status 显示为 昨天xxx点，格式24h
    //昨天之前发的status 显示为 MM:dd
    //去年的status    显示为  yyyy-MM-dd
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"EEE MMM d HH:mm:ss zzzz yyyy";
    NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    format.locale = locale;
    NSDate *date = [format dateFromString:self];
    
    NSTimeInterval inter = [date timeIntervalSinceNow];
    if (inter < 0) {
        inter = -inter;
    }
    NSTimeInterval dayInter = floor(inter / 86400);
    NSTimeInterval yestorday = floor(dayInter / 2);
    NSTimeInterval days = dayInter;
    NSTimeInterval weaks = ceil(dayInter / 7);
    NSTimeInterval months = ceil(dayInter / 30);
    NSTimeInterval years = ceil(dayInter / 365);
    
    if (dayInter <= 0) {
        if (inter < 60) {
            return @"刚刚";
        }
        if (inter < 120) {
            return @"1分钟前";
        }
        if (inter < 60 * 60) {
            return [NSString stringWithFormat:@"%.0f分钟前", floor(inter / 60)];
        }
        if (inter < 86400){
            return [NSString stringWithFormat:@"%.0f小时前", floor(inter / 3600)];
        }
        
        
    } else if (yestorday <= 0) {
        format.dateFormat = @"HH:mm";
        return [NSString stringWithFormat:@"昨天%@", date];
    } else if (months < 12){
        format.dateFormat = @"MM-dd";
        return [[format stringFromDate:date] stringByReplacingOccurrencesOfString:@"0" withString:@""];
        
    }else {
        format.dateFormat = @"yyyy-MM-d";
        
        return [format stringFromDate:date];
        
    }
    return @"";
}

@end
