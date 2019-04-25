//
//  MSHero.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/25.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "MSHero.h"

@implementation MSHero
+ (instancetype)heroWithDict:(NSDictionary *)dict
{
    MSHero *hero = [[self alloc] init];
//    hero.name = dict[@"name"];
//    hero.name = dict[@"icon"];
//    hero.name = dict[@"intro"];
    [hero setValuesForKeysWithDictionary:dict];
    return hero;
}
@end
