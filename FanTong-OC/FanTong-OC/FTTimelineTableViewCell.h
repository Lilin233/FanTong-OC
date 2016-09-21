//
//  FTTimelineTableViewCell.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/18.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTTimelineCellViewModel.h"
@class FTTimelineTableViewCell;
@protocol StatusToolbarDelegate <NSObject>

- (void)replyButtonClick:(FTTimelineTableViewCell *)cell;
- (void)repostButtonClick:(FTTimelineTableViewCell *)cell;
- (void)likeButtonClick:(FTTimelineTableViewCell *)cell;

@end

@interface FTTimelineTableViewCell : UITableViewCell

@property (nonatomic, strong)FTTimelineCellViewModel *viewModel;
@property (nonatomic, weak)id<StatusToolbarDelegate>delegate;
@end
