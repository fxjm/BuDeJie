//
//  FLPEssenceViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPEssenceViewController.h"

@interface FLPEssenceViewController ()

@end

@implementation FLPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.redColor;
    
    [self setNavTitle];
}

#pragma mark - 设置title
-(void)setNavTitle{
    //设置标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置左边的item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] hightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    
    //设置右边的item
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] hightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(game)];
}

#pragma mark - titleAction
-(void)game{
    FLPFunc;
}
@end
