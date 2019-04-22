//
//  Shop.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/22.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "Shop.h"

@implementation Shop

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)shopWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
