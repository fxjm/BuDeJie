//
//  FLPNewViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPNewViewController.h"
#import "FLPTagSubTableViewController.h"
@interface FLPNewViewController ()

@end

@implementation FLPNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = UIColor.greenColor;
    [self setNavTitle];
}

#pragma mark - 设置title
-(void)setNavTitle{
    //设置标题
    self.navigationItem.title = @"新帖";
    //设置左边的item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] hightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagSub)];
}

#pragma mark - titleAction
-(void)tagSub{
    FLPTagSubTableViewController *tabSubVc = [[FLPTagSubTableViewController alloc] init];
    
    [self.navigationController pushViewController:tabSubVc animated:YES];
}

@end
