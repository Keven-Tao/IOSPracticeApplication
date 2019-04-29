//
//  DealCell.h
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/28.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSDeal;
NS_ASSUME_NONNULL_BEGIN

@interface DealCell : UITableViewCell
@property (nonatomic,strong) MSDeal *deal;

+ (instancetype)dealWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
