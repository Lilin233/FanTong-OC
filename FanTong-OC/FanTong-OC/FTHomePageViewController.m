//
//  FTHomePageViewController.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/8/11.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTHomePageViewController.h"
#import "FTLoginViewController.h"
@interface FTHomePageViewController ()

@end

@implementation FTHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"首页";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}
- (void)tap{
    FTLoginViewController *login = [[FTLoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
