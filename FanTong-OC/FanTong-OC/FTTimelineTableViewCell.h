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

@protocol TimeLineCellDelegate <NSObject>

- (void)statusAvatarClick:(FTTimelineTableViewCell *)cell;
- (void)statusImageClick:(UIImageView *)imageView;
@end


@interface FTTimelineTableViewCell : UITableViewCell

@property (nonatomic, weak)id<StatusToolbarDelegate>delegate;
@property (nonatomic, weak)id<TimeLineCellDelegate>cellDelegate;

- (void)bindViewModel:(FTTimelineCellViewModel *)viewModel;
@end
