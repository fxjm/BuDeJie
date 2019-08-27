//
//  FLPLoginRegisterView.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/27.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPLoginRegisterView.h"

@interface FLPLoginRegisterView()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

@implementation FLPLoginRegisterView

+ (instancetype)loginView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (instancetype)registerView{
     return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    UIImage *image = _loginBtn.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    // 让按钮背景图片不要被拉伸
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    
    UIImage *highBackImage = [UIImage imageNamed:@"loginBtnBgClick"];
    
    highBackImage = [highBackImage stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
     [_loginBtn setBackgroundImage:highBackImage forState:UIControlStateHighlighted];
}

@end
