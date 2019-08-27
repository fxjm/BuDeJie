//
//  FLPADViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/24.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPADViewController.h"
#import "FLPAdItem.h"
#import "FLPTabBarController.h"
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/SDWebImage.h>
#import <MJExtension/MJExtension.h>
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
@interface FLPADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property (nonatomic, strong) FLPAdItem *item;

@property (nonatomic, weak) UIImageView *adView;

@property (nonatomic, weak) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@end

@implementation FLPADViewController

- (UIImageView *)adView{
    if (!_adView) {
        UIImageView *adView = [[UIImageView alloc] init];
        adView.frame = self.adContainView.bounds;
        adView.userInteractionEnabled = YES;
        _adView = adView;
        [self.adContainView addSubview:_adView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [_adView addGestureRecognizer:tap];
    }
    return _adView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLaunchImage];
    [self loadAdData];
   
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    //http://dspsdk.spriteapp.com/get?ad=self.baisibudejieHD.iphone.splash.18110717002
    
    //首页顶部分类:http://s.budejie.com/public/list-appbar/bsbdjhd-iphone-5.1.6/
    
    //精华curl http://e.api.budejie.com/v2/topic/feed/1/29688290-29696715/bsbdjhd-iphone-5.1.6/0-25.json?t=时间戳
}
#pragma mark - 加载广告数据
- (void)loadAdData
{
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
     
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
//    __weak typeof(self) weakSelf = self;
    // 3.发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 获取字典
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        // 字典转模型
        self.item = [FLPAdItem mj_objectWithKeyValues:adDict];
        
        
        [self.adView sd_setImageWithURL:[NSURL URLWithString:self.item.w_picurl]];
        
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        FLPLog(@"%@",error);
    }];
    
}
//设置启动图片并且屏幕适配
-(void)setLaunchImage{
    // 6p:LaunchImage-800-Portrait-736h@3x.png
    // 6:LaunchImage-800-667h@2x.png
    // 5:LaunchImage-568h@2x.png
    // 4s:LaunchImage@2x.png
    if (iphone6P) { // 6p
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iphone6) { // 6
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iphone5) { // 5
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-568h"];
        
    } else if (iphone4) { // 4
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }else{
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage@2x.png"];
    }
    
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)tap{
    NSURL *url = [NSURL URLWithString:self.item.curl];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    
    
}
- (IBAction)jump:(UIButton *)sender {
    [_timer invalidate];
    FLPTabBarController *tab = [[FLPTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tab;
}

- (void)timeChange{
    static int i = 3;
    if (i == 0) {
        [self jump:nil];
    }else{
        [self.jumpBtn setTitle:[NSString stringWithFormat:@"跳过(%d)",i] forState:UIControlStateNormal];
        i--;
    }
}
@end
