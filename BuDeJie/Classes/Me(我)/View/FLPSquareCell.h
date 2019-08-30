//
//  FLPSquareCell.h
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/29.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FLPSquareItem;
NS_ASSUME_NONNULL_BEGIN

@interface FLPSquareCell : UICollectionViewCell
/** 数据 */
@property (nonatomic, strong) FLPSquareItem *squareItem;

@end

NS_ASSUME_NONNULL_END
