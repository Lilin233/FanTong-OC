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

@property (nonatomic, assign)CGFloat height;

@property (nonatomic, assign)BOOL shouldRequestRemoteDataOnViewDidLoad;
- (instancetype)initWithParams:(NSDictionary *)params;

- (void)initialize;
@end
