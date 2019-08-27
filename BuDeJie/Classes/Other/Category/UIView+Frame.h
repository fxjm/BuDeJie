//
//  UIView+Frame.h
//  BuDeJie
//
//  Created by xiaomage on 16/3/12.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 
    写分类:避免跟其他开发者产生冲突,加前缀
 
 */
@interface UIView (Frame)

@property CGFloat flp_width;
@property CGFloat flp_height;
@property CGFloat flp_x;
@property CGFloat flp_y;
@property CGFloat flp_centerX;
@property CGFloat flp_centerY;
@end
