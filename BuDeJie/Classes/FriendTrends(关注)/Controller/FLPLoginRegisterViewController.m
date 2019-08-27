//
//  FLPLoginRegisterViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/26.
//  Copyright © 2019 lipeng feng. All rights reserved.
//登陆注册页面

/**
 步骤:
 1.划分结构(顶部 中间 底部)，创建占位试图 2.一个结构一个结构的搭建细节
 */

#import "FLPLoginRegisterViewController.h"
#import "FLPFastLoginView.h"
#import "FLPLoginRegisterView.h"
@interface FLPLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleLeftCons;

@end

@implementation FLPLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加快速登陆view
    FLPFastLoginView *fastView = [FLPFastLoginView fastLoginView];
    [self.bottomView addSubview:fastView];
    
    //登陆view
    FLPLoginRegisterView *loginView = [FLPLoginRegisterView loginView];
    [self.middleView addSubview:loginView];
    
    
    //注册view
    FLPLoginRegisterView *registerView = [FLPLoginRegisterView registerView];
    [self.middleView addSubview:registerView];
    
    
}
- (IBAction)loginClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    self.middleLeftCons.constant = self.middleLeftCons.constant == 0 ? -self.middleView.flp_width * 0.5 : 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)closeClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 设置子控件尺寸
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    FLPFastLoginView *fastView = self.bottomView.subviews[0];
    fastView.frame = self.bottomView.bounds;
    
    FLPLoginRegisterView *loginView = self.middleView.subviews[0];
    loginView.frame = CGRectMake(0, 0, self.middleView.flp_width * 0.5, self.middleView.flp_height);
    
    
    FLPLoginRegisterView *registerView = self.middleView.subviews[1];
    registerView.frame = CGRectMake(self.middleView.flp_width * 0.5, 0, self.middleView.flp_width * 0.5, self.middleView.flp_height);
    
}
@end
