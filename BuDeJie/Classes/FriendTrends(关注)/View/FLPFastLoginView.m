//
//  FLPFastLoginView.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/27.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPFastLoginView.h"

@implementation FLPFastLoginView

+ (instancetype)fastLoginView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
