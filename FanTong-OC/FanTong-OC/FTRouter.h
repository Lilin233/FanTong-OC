//
//  FTRouter.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/7.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FTViewController;
@class FTViewModel;
@interface FTRouter : NSObject

+ (instancetype)sharedInstance;

- (FTViewController *)viewControllerForViewModel:(FTViewModel *)viewModel;
@end
