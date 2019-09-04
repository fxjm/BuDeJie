//
//  FLPEssenceViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPEssenceViewController.h"
#import "FLPTitleButton.h"
#import "FLPAllViewController.h"
#import "FLPVideoViewController.h"
#import "FLPVoiceViewController.h"
#import "FLPPictureViewController.h"
#import "FLPWordViewController.h"

@interface FLPEssenceViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *contentScrollView;
@property (nonatomic, weak) UIView *titleView;
@property (nonatomic, weak) FLPTitleButton *proviceClickButton;
@property (nonatomic, weak) UIView *underLineView;
@end

@implementation FLPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setUpAllChildVc];
    
    
    [self setNavTitle];
    
    //设置内容scrollView
    [self setUpScrollView];
    //设置标题view
    [self setUpTitleView];
    
    
}

#pragma mark - 初始化
#pragma mark 设置title
-(void)setNavTitle{
    //设置标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置左边的item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] hightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    
    //设置右边的item
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] hightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(game)];
}

#pragma mark  设置内容scrollView
-(void)setUpScrollView{
    
    //不允许自动修改scrollview的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.delegate = self;
    contentScrollView.frame = self.view.bounds;
    contentScrollView.showsVerticalScrollIndicator = NO;
    contentScrollView.showsHorizontalScrollIndicator = NO;
    contentScrollView.pagingEnabled = YES;
    [self.view addSubview:contentScrollView];
    _contentScrollView = contentScrollView;
   
    
    CGFloat scrollViewW = contentScrollView.flp_width;
    CGFloat scrollViewH = contentScrollView.flp_height;
    //添加子view
    NSUInteger count = self.childViewControllers.count;
    for (int i = 0; i < count; ++i) {
        UIView *childView = self.childViewControllers[i].view;
        
        //这样设置就没有cell的穿透效果了
//        childView.frame = CGRectMake(i * scrollViewW, 35, contentScrollView.flp_width, scrollViewH-35-TabbarSafeBottomMargin-Height_NavBar-Height_Tabbar);
        
        //如果要tableView穿透效果，则tableview必须占据整个屏幕
         childView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        
        [contentScrollView addSubview:childView];
    }
    contentScrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
}

#pragma mark  设置标题view
-(void)setUpTitleView{
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
//    titleView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
//    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    titleView.frame = CGRectMake(0, Height_NavBar, self.view.flp_width, 35);
    [self.view addSubview:titleView];
    _titleView = titleView;
    
    
    //设置标题的按钮
    [self setUpTitleButton];
    
    //设置标题下划线
    [self setUpUnderLine];
}

#pragma mark  设置标题的按钮
-(void)setUpTitleButton{
    NSArray *titleArray = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSUInteger count = titleArray.count;
    CGFloat titleButtonW = self.titleView.flp_width / count;
    CGFloat titleButtonH = self.titleView.flp_height;
    for (NSUInteger i = 0; i < count; ++i) {
        FLPTitleButton *titleButton = [[FLPTitleButton alloc] init];
        titleButton.tag = i;
        titleButton.flp_x = i * titleButtonW;
        titleButton.flp_width = titleButtonW;
        titleButton.flp_height = titleButtonH;
        [titleButton setTitle:titleArray[i] forState:UIControlStateNormal];
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:titleButton];
    }
    
}

#pragma mark 设置下划线
-(void)setUpUnderLine{
    
    //获取第一个按钮
    FLPTitleButton *firstTitleButton = self.titleView.subviews.firstObject;
    
    UIView *underLineView = [[UIView alloc] init];
    underLineView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    underLineView.flp_height = 2;
    underLineView.flp_y = self.titleView.flp_height - underLineView.flp_height;
    [self.titleView addSubview:underLineView];
    self.underLineView = underLineView;
    

    [firstTitleButton.titleLabel sizeToFit];
    firstTitleButton.selected = YES;
    self.proviceClickButton = firstTitleButton;
    self.underLineView.flp_width = firstTitleButton.titleLabel.flp_width + 10;
    self.underLineView.flp_centerX = firstTitleButton.flp_centerX;
    
}

#pragma mark 设置全部的自控制器
-(void)setUpAllChildVc{
    
    FLPAllViewController *allVc = [[FLPAllViewController alloc] init];
    [self addChildViewController:allVc];
    
    FLPVideoViewController *videoVc = [[FLPVideoViewController alloc] init];
    [self addChildViewController:videoVc];
    
    FLPVoiceViewController *voiceVc = [[FLPVoiceViewController alloc] init];
    [self addChildViewController:voiceVc];
    
    FLPPictureViewController *pictureVc = [[FLPPictureViewController alloc] init];
    [self addChildViewController:pictureVc];
    
    FLPWordViewController *wordVc = [[FLPWordViewController alloc] init];
    [self addChildViewController:wordVc];
}

#pragma mark - 监听
-(void)game{
    FLPFunc
}

#pragma mark 标题按钮点击
-(void)titleButtonClick:(FLPTitleButton *)titleButton{
    self.proviceClickButton.selected = NO;
    titleButton.selected = YES;
    self.proviceClickButton = titleButton;
    [UIView animateWithDuration:0.5 animations:^{
        self.underLineView.flp_width = titleButton.titleLabel.flp_width + 10;
        self.underLineView.flp_centerX = titleButton.flp_centerX;
        self.contentScrollView.contentOffset = CGPointMake(titleButton.tag * self.contentScrollView.flp_width, self.contentScrollView.contentOffset.y);
    }];
}

#pragma mark - UIScrollViewDelegate

/**
 当用户松开scrollView，并且滑动结束的时候调用，scrollView停止滚动的时候调用
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //1.求出索引
    NSInteger index = scrollView.contentOffset.x / scrollView.flp_width;
    
    FLPTitleButton *titleButton = self.titleView.subviews[index];
    
//    FLPTitleButton *titleButton = [self.titleView viewWithTag:index];
    [self titleButtonClick:titleButton];
}
@end
