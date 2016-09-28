//
//  FTTableViewController.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/28.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTViewController.h"
@class FTTableViewModel;
@interface FTTableViewController : FTViewController
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)FTTableViewModel *viewModel;

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;
@end
