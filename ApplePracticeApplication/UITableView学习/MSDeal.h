//
//  MSDeal.h
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/28.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSDeal : NSObject
@property (strong, nonatomic) NSString *buyCount;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *icon;

+ (instancetype)dealWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
