//
//  FTTableViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/18.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTTableViewModel.h"

@implementation FTTableViewModel

- (instancetype)initWithParams:(NSDictionary *)params{
    self = [super initWithParams:params];
    if (self) {
        self.shouldPullToRefresh = YES;
        self.shouldInfiniteScrolling = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        self.page = 1;
    }
    return self;
}
@end
