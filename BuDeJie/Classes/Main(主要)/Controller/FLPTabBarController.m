//
//  FLPTabBarController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPTabBarController.h"
#import "FLPNewViewController.h"
#import "FLPEssenceViewController.h"
#import "FLPFriendTrendsViewController.h"
#import "FLPPublicViewController.h"
#import "FLPMeViewController.h"
#import "UIImage+FLPImage.h"
@interface FLPTabBarController ()

@end

@implementation FLPTabBarController

+(void)load{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    NSMutableDictionary *selectedDic = [NSMutableDictionary dictionary];
    selectedDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [tabBarItem setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
    
    //设置字体大小，字体大小只有设置默认才有效
    NSMutableDictionary *norDic = [NSMutableDictionary dictionary];
    norDic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [tabBarItem setTitleTextAttributes:norDic forState:UIControlStateNormal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    //设置所有的子控制器
    [self setUpAllChildVc];
    
    //设置所有自控制器的标题和图片
    [self setUpAllTitle];
}

#pragma mark -  设置所有的子控制器
-(void)setUpAllChildVc{
    
    //精华
    FLPEssenceViewController *essenceVc = [[FLPEssenceViewController alloc] init];
    UINavigationController *essenceNav = [[UINavigationController alloc] initWithRootViewController:essenceVc];
    [self addChildViewController:essenceNav];
    
    //新帖
    FLPNewViewController *newVc = [[FLPNewViewController alloc] init];
    UINavigationController *newNav = [[UINavigationController alloc] initWithRootViewController:newVc];
    [self addChildViewController:newNav];
    
    //发布
    FLPPublicViewController *publicVc = [[FLPPublicViewController alloc] init];
    [self addChildViewController:publicVc];
    
    //关注
    FLPFriendTrendsViewController *friendTrendsVc = [[FLPFriendTrendsViewController alloc] init];
    UINavigationController *friendTrendsNav = [[UINavigationController alloc] initWithRootViewController:friendTrendsVc];
    [self addChildViewController:friendTrendsNav];
    
    //我
    FLPMeViewController *meVc = [[FLPMeViewController alloc] init];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:meVc];
    [self addChildViewController:meNav];
}

#pragma mark - 设置所有自控制器的标题和图片
-(void)setUpAllTitle{
    UINavigationController *essenceNav = self.childViewControllers[0];
    essenceNav.tabBarItem.title = @"精华";
    essenceNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    essenceNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    UINavigationController *newNav = self.childViewControllers[1];
    newNav.tabBarItem.title = @"新帖";
    newNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    newNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    
    UIViewController *publicVc = self.childViewControllers[2];
    publicVc.tabBarItem.image = [UIImage imageNamed:@"tabBar_publish_icon"];
    publicVc.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_publish_click_icon"];
    
    UINavigationController *friendTrendsNav = self.childViewControllers[3];
    friendTrendsNav.tabBarItem.title = @"关注";
    friendTrendsNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    friendTrendsNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    UINavigationController *meNav = self.childViewControllers[4];
    meNav.tabBarItem.title = @"我";
    meNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    meNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
}

@end
