//
//  FLPAdItem.h
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/26.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FLPAdItem : NSObject
/** 广告地址 */
@property (nonatomic, strong) NSString *w_picurl;
/** 点击广告跳转的界面 */
@property (nonatomic, strong) NSString *curl;
@end

NS_ASSUME_NONNULL_END
