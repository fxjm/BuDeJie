//
//  FLPEssenceViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPEssenceViewController.h"
#import "FLPTitleButton.h"
@interface FLPEssenceViewController ()
@property (nonatomic, weak) UIView *titleView;
@property (nonatomic, weak) FLPTitleButton *proviceClickButton;
@property (nonatomic, weak) UIView *underLineView;
@end

@implementation FLPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.redColor;
    
    [self setNavTitle];
    
    //设置内容scrollView
    [self setUpScrollView];
    //设置标题view
    [self setUpTitleView];
    
    //设置标题的按钮
    [self setUpTitleButton];
    
    //设置标题下划线
    [self setUpUnderLine];
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
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.backgroundColor = [UIColor greenColor];
    contentScrollView.frame = self.view.bounds;
    [self.view addSubview:contentScrollView];
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
}

#pragma mark  设置标题的按钮
-(void)setUpTitleButton{
    NSArray *titleArray = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSUInteger count = titleArray.count;
    CGFloat titleButtonW = self.titleView.flp_width / count;
    CGFloat titleButtonH = self.titleView.flp_height;
    for (NSUInteger i = 0; i < count; ++i) {
        FLPTitleButton *titleButton = [[FLPTitleButton alloc] init];
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

#pragma mark - 监听
-(void)game{
    FLPFunc
}

#pragma mark 按钮点击
-(void)titleButtonClick:(FLPTitleButton *)titleButton{
    self.proviceClickButton.selected = NO;
    titleButton.selected = YES;
    self.proviceClickButton = titleButton;
    [UIView animateWithDuration:0.5 animations:^{
        self.underLineView.flp_width = titleButton.titleLabel.flp_width + 10;
        self.underLineView.flp_centerX = titleButton.flp_centerX;
        
//        NSDictionary *dict = @{NSFontAttributeName:titleButton.titleLabel.font};
//        self.underLineView.flp_width = [titleButton.titleLabel.text sizeWithAttributes:dict].width;
    }];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
  
    
}
@end
