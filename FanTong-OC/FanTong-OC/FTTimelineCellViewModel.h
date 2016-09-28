//
//  FTTimelineCellViewModel.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/18.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTViewModel.h"
#import "FTModels.h"
@interface FTTimelineCellViewModel : FTViewModel

@property (nonatomic, strong)Status *status;

@property (nonatomic, strong)RACCommand *didClickLinkCommand;

///< status 文本内容高度
@property (nonatomic, assign)CGFloat contentHeight;

- (instancetype)initWithModel:(Status *)status;
@end
