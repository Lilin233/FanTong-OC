//
//  FTTimelineTableViewCell.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/18.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTTimelineTableViewCell.h"
#import "FTStatusToolBar.h"
@interface FTTimelineTableViewCell()<DTAttributedTextContentViewDelegate>{
    UIImageView *_avatarImageView;
    UILabel *_statusTitleLabel;
    DTAttributedLabel *_statusContentLabel;
    UILabel *_statusDateLabel;
    UIImageView *_statusImageView;
    FTStatusToolBar *_statusToolBar;
}

@end

@implementation FTTimelineTableViewCell

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
#pragma mark Add SubViews
- (void)initSubViews{
    _avatarImageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kStatusAvatarMarginLeft, kStatusAvatarMarginTop, kStatusAvatarHeight, kStatusAvatarHeight)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        imageView;
    });
    
    _statusTitleLabel = ({
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_avatarImageView.right + kStatusAvatarMarginLeft, kStatusAvatarMarginTop, SCREEN_WIDTH - (_avatarImageView.right + kStatusAvatarMarginLeft), _avatarImageView.height)];
        label.font = kStatusTitleFont;
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
        label;
    });
    
    _statusContentLabel = ({
        DTAttributedLabel *label = [[DTAttributedLabel alloc]initWithFrame:CGRectMake(kStatusAvatarMarginLeft, _avatarImageView.bottom + kStatusContentPadding, kStatusContetnWidth, 0)];
        label.lineBreakMode = NSLineBreakByCharWrapping;
        label.numberOfLines = 0;
        label.delegate = self;
        [self addSubview:label];
        label;
    });
    
    _statusDateLabel = ({
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
        label.font = kStatusContentFont;
        [self addSubview:label];
        label;
    });
    
    _statusImageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.height - kStatusToolbarHeight - kStatusImageViewHeight, SCREEN_WIDTH, kStatusImageViewHeight)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:imageView];
        imageView;
    });

    _statusToolBar = ({
        FTStatusToolBar *toolbar = [[FTStatusToolBar alloc]initWithFrame:CGRectMake(kStatusAvatarMarginLeft, self.height - kStatusToolbarHeight, SCREEN_HEIGHT, kStatusToolbarHeight)];
        toolbar.cell = self;
        toolbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:toolbar];
        toolbar;
    
    });
    
}
#pragma mark Private Methods
- (void)layoutStatusSubViews{
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:_viewModel.status.user.profile_image_url_large]];
    _statusTitleLabel.text = _viewModel.status.user.screen_name;
    [_statusContentLabel setHeight:_viewModel.contentHeight];
    _statusContentLabel.attributedString = [_viewModel.status.text formatterHTMLAttributeString];
    [_statusImageView sd_setImageWithURL:[NSURL URLWithString:_viewModel.status.photo.imageurl]];
}

#pragma mark Custom Accessors
- (void)setViewModel:(FTTimelineCellViewModel *)viewModel{
    if (_viewModel != viewModel) {
        _viewModel = viewModel;
        [self layoutStatusSubViews];
    }
}
@end
