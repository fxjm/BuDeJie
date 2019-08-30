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
#import "FLPTabBar.h"
#import "FLPNavigationController.h"
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
    
    //设置所有子控制器的标题和图片
    [self setUpAllTitle];
    
    //设置tabbar
    [self setUpTabBar];
}

#pragma mark -  设置所有的子控制器
-(void)setUpAllChildVc{
    
    //精华
    FLPEssenceViewController *essenceVc = [[FLPEssenceViewController alloc] init];
    FLPNavigationController *essenceNav = [[FLPNavigationController alloc] initWithRootViewController:essenceVc];
    [self addChildViewController:essenceNav];
    
    //新帖
    FLPNewViewController *newVc = [[FLPNewViewController alloc] init];
    FLPNavigationController *newNav = [[FLPNavigationController alloc] initWithRootViewController:newVc];
    [self addChildViewController:newNav];
    
    //关注
    FLPFriendTrendsViewController *friendTrendsVc = [[FLPFriendTrendsViewController alloc] init];
    FLPNavigationController *friendTrendsNav = [[FLPNavigationController alloc] initWithRootViewController:friendTrendsVc];
    [self addChildViewController:friendTrendsNav];
    
    //我
    UIStoryboard *meStoryboard = [UIStoryboard storyboardWithName:@"FLPMeViewController" bundle:nil] ;
//    FLPMeViewController *meVc = [[FLPMeViewController alloc] init];
    FLPMeViewController *meVc = [meStoryboard instantiateInitialViewController];
    FLPNavigationController *meNav = [[FLPNavigationController alloc] initWithRootViewController:meVc];
    [self addChildViewController:meNav];
}

#pragma mark - 设置所有自控制器的标题和图片
-(void)setUpAllTitle{
    //精华
    UINavigationController *essenceNav = self.childViewControllers[0];
    essenceNav.tabBarItem.title = @"精华";
    essenceNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    essenceNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    //新帖
    UINavigationController *newNav = self.childViewControllers[1];
    newNav.tabBarItem.title = @"新帖";
    newNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    newNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    
    //关注
    UINavigationController *friendTrendsNav = self.childViewControllers[2];
    friendTrendsNav.tabBarItem.title = @"关注";
    friendTrendsNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    friendTrendsNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    //我
    UINavigationController *meNav = self.childViewControllers[3];
    meNav.tabBarItem.title = @"我";
    meNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    meNav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];
}


#pragma mark - 设置tabbar
-(void)setUpTabBar{
    
    FLPTabBar *tabBar = [[FLPTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//     NSLog(@"%@",self.tabBar);
//    NSLog(@"%@",self.tabBar.subviews);
}
@end
//- (void)viewWillLayoutSubviews{
//    [super viewWillLayoutSubviews];
//    //移除tabbar的子控件
//    for (UIView *child in self.tabBar.subviews) {
//        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [child removeFromSuperview];
//        }
//    }
//
//}
//- (void)setUpTabBar{
//
//    XYNTabBarView *tabBarV = [[XYNTabBarView alloc] init];
//    tabBarV.items = self.items;
//    [self.tabBar addSubview:tabBarV];
//    tabBarV.backgroundColor = [UIColor redColor];
//    tabBarV.frame = self.tabBar.bounds;
//    tabBarV.delegate = self;
//
//
//
//}
