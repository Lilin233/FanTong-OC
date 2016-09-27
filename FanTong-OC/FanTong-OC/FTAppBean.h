//
//  FTAppBean.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/27.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTAppBean : NSObject
@property (nonatomic, strong)User *loginUser;

+ (instancetype)shareInstance;
@end
