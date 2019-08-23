//
//  UIBarButtonItem+Item.h
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/23.
//  Copyright © 2019 lipeng feng. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image hightImage:(UIImage *)hightImage target:(nullable id)target action:(SEL)action;

+(UIBarButtonItem *)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(nullable id)target action:(SEL)action;
+(UIBarButtonItem *)backItemWithImage:(UIImage *)image hightImage:(UIImage *)hightImage target:(nullable id)target action:(SEL)action title:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
