//
//  NSString+Ext.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/12.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "NSString+Ext.h"

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

@end
