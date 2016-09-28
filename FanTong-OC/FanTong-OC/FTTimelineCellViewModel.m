//
//  FTTimelineCellViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/18.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTTimelineCellViewModel.h"

@implementation FTTimelineCellViewModel

- (instancetype)initWithModel:(Status *)status{
    self = [super initWithParams:nil];
    if (self) {
        if (status) {
            _status = status;
            [self layout];
        }
    }
    return self;

}
- (void)layout{
    [self layoutStatusContent];
    self.height = ({
        CGFloat height = 0;
        height += kStatusAvatarMarginTop;
        height += kStatusAvatarHeight;
        height += kStatusContentPadding;
        height += _contentHeight;
        if (_status.photo.thumburl.length > 0) {
            height += kStatusContentPadding;
            height += kStatusImageViewHeight;
        }
        height += kStatusToolbarHeight;
        height;
    });
}
- (void)layoutStatusContent{
    _contentHeight = [[_status.text formatterHTMLAttributeString] layoutAttributedString].size.height;
}
@end
