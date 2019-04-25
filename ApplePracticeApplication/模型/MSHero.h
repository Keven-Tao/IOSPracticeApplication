//
//  MSHero.h
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/25.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSHero : NSObject
@property (nonatomic,strong) NSString *name;//姓名
@property (nonatomic,strong) NSString *icon;//头像
@property (nonatomic,strong) NSString *intro;//简介

+ (instancetype)heroWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
