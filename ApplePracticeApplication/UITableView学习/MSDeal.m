//
//  MSDeal.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/28.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "MSDeal.h"

@implementation MSDeal

+ (instancetype)dealWithDict:(NSDictionary *)dict
{
    MSDeal *deal = [[self alloc] init];
    [deal setValuesForKeysWithDictionary:dict];
    return deal;
}
@end
