//
//  FTViewController.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/8/11.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FTViewModel;
@interface FTViewController : UIViewController

@property (nonatomic, strong)FTViewModel *viewModel;

- (instancetype)initWithViewModel:(FTViewModel *)viewModel;

- (void)bindViewModel;
@end
