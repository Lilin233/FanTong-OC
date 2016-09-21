//
//  FTStatusToolBar.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/18.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTStatusToolBar.h"
#import "FTTimelineTableViewCell.h"
@interface FTStatusToolBar(){
    UIButton *_replyButton;
    UIButton *_repostButton;
    UIButton *_likeButton;

}

@end

@implementation FTStatusToolBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

#pragma mark Add SubViews
- (void)initSubViews{
    
    _replyButton = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kStatusTollbarButtonWidth, kStatusToolbarHeight)];
        [button setTitle:@"reply" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        @weakify(self)
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self)
            if ([self.cell.delegate respondsToSelector:@selector(replyButtonClick:) ]) {
                [self.cell.delegate replyButtonClick:self.cell];
            }

        }];
        [self addSubview:button];
        button;
        
    });

    _repostButton = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(_replyButton.right, 0, kStatusTollbarButtonWidth, kStatusToolbarHeight)];
        [button setTitle:@"repost" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        @weakify(self)
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self)
            if ([self.cell.delegate respondsToSelector:@selector(repostButtonClick:) ]) {
                [self.cell.delegate repostButtonClick:self.cell];
            }

        }];
        
        [self addSubview:button];
        button;
        
    });

    _likeButton = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(_repostButton.right, 0, kStatusTollbarButtonWidth, kStatusToolbarHeight)];
        [button setTitle:@"like" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        @weakify(self)
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self)
            if ([self.cell.delegate respondsToSelector:@selector(likeButtonClick:) ]) {
                [self.cell.delegate likeButtonClick:self.cell];
            }
        }];
        [self addSubview:button];
        button;
        
    });

}

@end
