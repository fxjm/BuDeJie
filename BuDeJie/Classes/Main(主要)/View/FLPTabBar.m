//
//  FLPTabBar.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/23.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPTabBar.h"
@interface FLPTabBar()
@property (nonatomic, weak) UIButton *plusButton;
@end


@implementation FLPTabBar

- (UIButton *)plusButton{
    if (!_plusButton) {
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:plusButton];
        _plusButton = plusButton;
    }
    return _plusButton;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = self.items.count;
    int i = 0;
    CGFloat btnW = self.flp_width / (count + 1);
    CGFloat btnH = 0;
    CGFloat btnY = 0;
    for (UIView *barButton in self.subviews) {
        if ([barButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i++;
            }
            btnH = barButton.flp_height;
            btnY = barButton.flp_y;
            barButton.frame = CGRectMake(i * btnW, btnY, btnW, btnH);
            i++;
        }
    }
    self.plusButton.frame = CGRectMake(btnW * 2, btnY, btnW, btnH);
}
@end
