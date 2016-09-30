//
//  FTConversationCellViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/27.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTConversationCellViewModel.h"
@implementation FTConversationCellViewModel

- (instancetype)initWitDirectMessageModel:(DirectMessage *)dm{
    self = [super init];
    if (self) {
        if (_dm != dm) {
            _dm = dm;
            self.height = 60;
            [self resetDmData];
        }
    }
    return self;
}


- (void)resetDmData{
    _text = _dm.text;

}

#pragma mark Custom Accessors

@end
