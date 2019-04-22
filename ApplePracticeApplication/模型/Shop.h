//
//  Shop.h
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/22.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Shop : NSObject
@property (nonatomic,copy) NSString *name;//商品名
@property (nonatomic,copy) NSString *icon;//商品图片

- (instancetype) initWithDict:(NSDictionary *) dict;
+ (instancetype) shopWithDict:(NSDictionary *) dict;
@end

NS_ASSUME_NONNULL_END
