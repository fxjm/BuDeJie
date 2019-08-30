//
//  FLPSquareCell.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/29.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPSquareCell.h"
#import "FLPSquareItem.h"
#import <SDWebImage/SDWebImage.h>

@interface FLPSquareCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end
@implementation FLPSquareCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setSquareItem:(FLPSquareItem *)squareItem{
    _squareItem = squareItem;
    self.nameLabel.text = squareItem.name;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:squareItem.icon]];
    
}


@end
