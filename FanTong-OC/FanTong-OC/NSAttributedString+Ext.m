//
//  NSAttributedString+Ext.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/21.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "NSAttributedString+Ext.h"

@implementation NSAttributedString (Ext)
- (CGRect)layoutAttributedString{
    
    DTCoreTextLayouter *layouter = [[DTCoreTextLayouter alloc] initWithAttributedString:self];
    DTCoreTextLayoutFrame *layoutFrame = [layouter layoutFrameWithRect:CGRectMake(0, 0, kStatusContetnWidth, CGFLOAT_HEIGHT_UNKNOWN) range:NSMakeRange(0, self.length)];
    return layoutFrame.frame;
}
@end
