//
//  FLPSettingViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/23.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPSettingViewController.h"

@interface FLPSettingViewController ()

@end

@implementation FLPSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"jump" style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
}


-(void)jump{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor greenColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
