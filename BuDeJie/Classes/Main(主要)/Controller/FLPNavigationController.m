//
//  FLPNavigationController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/23.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPNavigationController.h"

@interface FLPNavigationController()<UIGestureRecognizerDelegate>

@end

@implementation FLPNavigationController
+ (void)load{
    //设置全局的nav字体大小
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *textDic = [NSMutableDictionary dictionary];
    textDic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [navBar setTitleTextAttributes:textDic];
    //设置nav顶部条
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    
    //禁用系统手势
    self.interactivePopGestureRecognizer.enabled = NO;
//    NSLog(@"%@",self.interactivePopGestureRecognizer);
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //真正的跳转
    [super pushViewController:viewController animated:animated];
    //非跟控制器才设置返回
    if (self.childViewControllers.count > 1) {
         viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] hightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
    }
}
-(void)back{
    [self popViewControllerAnimated:YES];
}


#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count > 1;
}


@end
