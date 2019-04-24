//
//  MSPageView.h
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/24.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSPageView : UIView
@property (nonatomic,strong) NSArray *imageNames;//展示的图片数组
@property (nonatomic,strong) UIColor *currentColor;//当前显示颜色
@property (nonatomic,strong) UIColor *otherColor;//未选中圆点颜色

+ (instancetype)pageView;
@end

NS_ASSUME_NONNULL_END
