//
//  FTConversationTableViewCell.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/27.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTConversationTableViewCell.h"

@interface FTConversationTableViewCell(){
    
    UILabel *_conversationLabel;
    
}
@property (nonatomic, strong)FTConversationCellViewModel *viewModel;
@end

@implementation FTConversationTableViewCell

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

- (void)initSubViews{
    _conversationLabel = ({
        UILabel *label = [[UILabel alloc]initWithFrame:self.contentView.bounds];
        label.numberOfLines = 0;
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
        label;
    });
}

#pragma mark Private

- (void)bindViewModel:(FTConversationCellViewModel *)viewModel{
    self.viewModel = viewModel;
    _conversationLabel.text = self.viewModel.text;

}
@end
