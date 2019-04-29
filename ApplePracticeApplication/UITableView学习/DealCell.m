//
//  DealCell.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/28.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "DealCell.h"
#import "MSDeal.h"

@interface DealCell()
@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *countLabel;

@end
@implementation DealCell

- (void)setDeal:(MSDeal *)deal
{
    _deal = deal;
    self.iconView.image = [UIImage imageNamed:deal.icon];
    self.titleLabel.text = deal.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",deal.price];
    self.countLabel.text = [NSString stringWithFormat:@"共有%@人购买",deal.buyCount];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)dealWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"deal";
    DealCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
    }
    
    return cell;
}
@end
