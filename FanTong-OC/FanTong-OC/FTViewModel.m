//
//  FTViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/7.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTViewModel.h"

@implementation FTViewModel

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    FTViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel)
    [[viewModel rac_signalForSelector:@selector(initWithService)]
        subscribeNext:^(id x) {
           @strongify(viewModel)
            [viewModel initialize];
        }];
    return viewModel;
}
- (instancetype)initWithService{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)initialize{

}

- (RACSubject *)willDisappearSignal{
    if (!_willDisappearSignal) {
        _willDisappearSignal = [RACSubject subject];
    }
    return _willDisappearSignal;
}
@end
