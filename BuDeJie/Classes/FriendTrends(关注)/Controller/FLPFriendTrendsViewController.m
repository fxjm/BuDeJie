//
//  FLPFriendTrendsViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPFriendTrendsViewController.h"

@interface FLPFriendTrendsViewController ()

@end

@implementation FLPFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.purpleColor;
    [self setNavTitle];
}

#pragma mark - 设置title
-(void)setNavTitle{
    //设置标题
   self.navigationItem.title = @"关注";
    //设置左边的item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] hightImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecomment)];
}

#pragma mark - titleAction
-(void)friendsRecomment{
    FLPFunc;
}

@end
