//
//  UIView+Frame.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/12.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setFlp_height:(CGFloat)flp_height
{
    CGRect rect = self.frame;
    rect.size.height = flp_height;
    self.frame = rect;
}

- (CGFloat)flp_height
{
    return self.frame.size.height;
}

- (CGFloat)flp_width
{
    return self.frame.size.width;
}
- (void)setFlp_width:(CGFloat)flp_width
{
    CGRect rect = self.frame;
    rect.size.width = flp_width;
    self.frame = rect;
}

- (CGFloat)flp_x
{
    return self.frame.origin.x;
    
}

- (void)setFlp_x:(CGFloat)flp_x
{
    CGRect rect = self.frame;
    rect.origin.x = flp_x;
    self.frame = rect;
}

- (void)setFlp_y:(CGFloat)flp_y
{
    CGRect rect = self.frame;
    rect.origin.y = flp_y;
    self.frame = rect;
}

- (CGFloat)flp_y
{

    return self.frame.origin.y;
}

- (void)setFlp_centerX:(CGFloat)flp_centerX{
    CGPoint center = self.center;
    center.x = flp_centerX;
    self.center = center;
}

- (CGFloat)flp_centerX{
    return self.center.x;
}

- (void)setFlp_centerY:(CGFloat)flp_centerY{
    CGPoint center = self.center;
    center.x = flp_centerY;
    self.center = center;
}

- (CGFloat)flp_centerY{
    return self.center.y;
}
@end
