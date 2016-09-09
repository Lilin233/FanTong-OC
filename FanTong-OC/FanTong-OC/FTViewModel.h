//
//  FTViewModel.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/7.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTViewModel : NSObject

@property (nonatomic, strong)RACSubject *willDisappearSignal;

- (instancetype)initWithParams:(NSDictionary *)params;

- (void)initialize;
@end
