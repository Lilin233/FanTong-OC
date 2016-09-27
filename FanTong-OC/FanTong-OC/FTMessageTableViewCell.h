//
//  FTMessageTableViewCell.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/26.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FTDirectMessageCellViewModel;
@interface FTMessageTableViewCell : UITableViewCell
@property (nonatomic, strong)FTDirectMessageCellViewModel *viewModel;
@end
