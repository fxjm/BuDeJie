//
//  UIImage+FLPImage.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "UIImage+FLPImage.h"

@implementation UIImage (FLPImage)
+(UIImage *)imageOriginalWithName:(NSString *)name{
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
