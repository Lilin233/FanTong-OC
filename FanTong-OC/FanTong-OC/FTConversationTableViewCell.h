//
//  FTConversationTableViewCell.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/27.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTConversationCellViewModel.h"
@interface FTConversationTableViewCell : UITableViewCell

- (void)bindViewModel:(FTConversationCellViewModel *)viewModel;
@end
