//
//  UIBarButtonItem+Item.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/23.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image hightImage:(UIImage *)hightImage target:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hightImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIView *contaicView = [[UIView alloc] initWithFrame:btn.bounds];
    [contaicView addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:contaicView];
}

+(UIBarButtonItem *)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIView *contaicView = [[UIView alloc] initWithFrame:btn.bounds];
    [contaicView addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:contaicView];
}

+(UIBarButtonItem *)backItemWithImage:(UIImage *)image hightImage:(UIImage *)hightImage target:(nullable id)target action:(SEL)action title:(NSString *)title{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:title forState:UIControlStateNormal];
    [backBtn setImage:image forState:UIControlStateNormal];
    [backBtn setImage:hightImage forState:UIControlStateHighlighted];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backBtn sizeToFit];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    UIView *contaicView = [[UIView alloc] initWithFrame:backBtn.bounds];
    [contaicView addSubview:backBtn];
    return [[UIBarButtonItem alloc] initWithCustomView:contaicView];
}
@end
