//
//  FLPSubTagCell.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/27.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPSubTagCell.h"
#import "FLPSubTag.h"
#import <SDWebImage/SDWebImage.h>
@interface FLPSubTagCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation FLPSubTagCell

//重写frame 用于设置线条
-(void)setFrame:(CGRect)frame{
//    frame.size.height -= 1;
    [super setFrame:frame];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _iconImageView.layer.cornerRadius = 30;
    _iconImageView.layer.masksToBounds = YES;
}



- (void)setSubTag:(FLPSubTag *)subTag{
    _subTag = subTag;
    self.titleLabel.text = subTag.theme_name;
    [self setNumber];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:subTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
//    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:subTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        //裁剪圆角图片
//        //1.开启图形上下文
//        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//        //2.描述裁剪区域
//        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//        //3.设置裁剪区域
//        [path addClip];
//        //4.画图片
//        [image drawAtPoint:CGPointZero];
//        //5.取出图片
//        image = UIGraphicsGetImageFromCurrentImageContext();
//        //6.关闭上下文
//        UIGraphicsEndImageContext();
//
//        self.imageView.image = image;
//    }];
}

- (void)setNumber{
    NSString *str = [NSString stringWithFormat:@"%@人订阅",_subTag.sub_number];
    if (_subTag.sub_number.intValue >= 10000) {
        CGFloat number = _subTag.sub_number.intValue / 10000.0;
        str = [NSString stringWithFormat:@"%.1f万人订阅",number];
        str = [str stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    self.numberLabel.text = str;
}
@end
