//
//  UILabel+MSExtension.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/18.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "UILabel+MSExtension.h"

@implementation UILabel (MSExtension)


# pragma mark - 项目中label自适应高度代码
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

# pragma mark - 项目中label自适应宽度的代码
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}
@end
