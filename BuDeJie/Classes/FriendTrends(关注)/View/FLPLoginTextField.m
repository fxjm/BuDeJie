//
//  FLPLoginTextField.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/29.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPLoginTextField.h"
#import "UITextField+PlaceHolder.h"
@implementation FLPLoginTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    
    //设置选中以后的输入颜色
    self.tintColor = [UIColor whiteColor];
    
    self.placeholderColor = [UIColor lightGrayColor];
    
    [self addTarget:self action:@selector(textDidBegin) forControlEvents:UIControlEventEditingDidBegin];
    
    [self addTarget:self action:@selector(textDidEnd) forControlEvents:UIControlEventEditingDidEnd];
    
}

-(void)textDidBegin{
    //开始编辑的时候设置placeHolder的颜色
     self.placeholderColor = [UIColor redColor];
}

-(void)textDidEnd{
    //结束编辑的时候设置placeHolder的颜色
     self.placeholderColor = [UIColor lightGrayColor];
    
}
@end
