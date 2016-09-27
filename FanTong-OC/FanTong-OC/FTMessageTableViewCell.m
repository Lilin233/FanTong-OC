//
//  FTMessageTableViewCell.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/26.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTMessageTableViewCell.h"
#import "FTDirectMessageCellViewModel.h"
@interface FTMessageTableViewCell(){
    UIImageView *_avatarImageView;
    UILabel* _senderNameLabel;
    UILabel *_contentLabel;
    UILabel *_dateLabel;
}

@end


@implementation FTMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}
-(void)initSubViews{
    _avatarImageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kStatusAvatarMarginLeft, kDirectMessageConversationListAvatarTopMarge, kDirectMessageConversationListAvatarHeight, kDirectMessageConversationListAvatarHeight)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        imageView;
    
    });
    
    _senderNameLabel = ({
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_avatarImageView.right + kStatusContentPadding, kDirectMessageConversationListSenderTopMargin, kDirectMessageConversationListSenderWidth, kDirectMessageConversationListSenderHeight)];
        label.font = kDirectMessageConversationListSenderFont;
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
        label;
    });
    
    _contentLabel = ({
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_senderNameLabel.left, _senderNameLabel.bottom, kDirectMessageConversationListSenderWidth, kDirectMessageConversationListContentHeight)];
        label.font = kDirectMessageConversationListContentFont;
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
        label;
    });
    
    _dateLabel = ({
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - kStatusDateWidth - kStatusContentPadding, _senderNameLabel.top, kStatusDateWidth, _senderNameLabel.height)];
        label.textAlignment = NSTextAlignmentRight;
        label.font = kStatusDateFont;
        label.textColor = [UIColor grayColor];
        [self addSubview:label];
        label;
    });
    
    
    
}

#pragma mark Private
- (void)congfigureMessageList{
    [_avatarImageView sd_setImageWithURL:self.viewModel.senderAvatarURL];
    _senderNameLabel.text = self.viewModel.senderName;
    _contentLabel.text = self.viewModel.directMessageLastContent;
    _dateLabel.text = self.viewModel.createDate;

}

#pragma mark Custom Accesstors
- (void)setViewModel:(FTDirectMessageCellViewModel *)viewModel{
    if (_viewModel != viewModel) {
        _viewModel = viewModel;
        [self congfigureMessageList];
    }
}
@end
