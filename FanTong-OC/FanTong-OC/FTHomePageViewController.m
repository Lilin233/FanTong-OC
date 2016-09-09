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
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FTLoginViewController *loginVC = [storyBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
//    [self.navigationController pushViewController:loginVC animated:YES];
    [self presentViewController:loginVC animated:NO completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
