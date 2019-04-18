//
//  UILabel+MSExtension.h
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/18.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (MSExtension)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
