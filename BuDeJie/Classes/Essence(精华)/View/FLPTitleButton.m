//
//  FLPTitleButton.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/9/2.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPTitleButton.h"

@implementation FLPTitleButton



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}


/**
 去除高亮状态
 */
-(void)setHighlighted:(BOOL)highlighted{
    
}

@end
