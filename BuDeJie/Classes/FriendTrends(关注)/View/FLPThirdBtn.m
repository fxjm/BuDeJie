//
//  FLPThirdBtn.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/27.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPThirdBtn.h"

@implementation FLPThirdBtn

- (void)layoutSubviews{
    [super layoutSubviews];
    //1.设置图片位置
    self.imageView.flp_y = 0;
    self.imageView.flp_centerX = self.flp_width * 0.5;
    //2.设置文字位置
    self.titleLabel.flp_y = CGRectGetMaxY(self.imageView.frame);
    [self.titleLabel sizeToFit];
    
    self.titleLabel.flp_centerX = self.flp_width * 0.5;
    
}
@end
