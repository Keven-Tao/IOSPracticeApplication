//
//  DealViewController.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/26.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "DealViewController.h"
#import "MSDeal.h"
#import "DealCell.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface DealViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *deals;
@end

@implementation DealViewController

- (NSArray *)deals
{
    if (_deals == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"deals" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *dealsArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MSDeal *deal = [MSDeal dealWithDict:dict];
            [dealsArray addObject:deal];
        }
        _deals = dealsArray;
    }
    return _deals;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, self.toolbar.bounds.size.height, self.view.bounds.size.width, 60)];
    topView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:topView];
    
    //添加按钮
    UIButton *addBtn = [[UIButton alloc] init];
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:addBtn];
    [addBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView.centerY);
        make.left.equalTo(topView.left).offset(10);
    }];
    
    //删除
    UIButton *deleteBtn = [[UIButton alloc] init];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    deleteBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [deleteBtn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:deleteBtn];
    [deleteBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView.centerY);
        make.left.equalTo(addBtn.right).offset(30);
    }];
    
    //更新按钮
    UIButton *updateBtn = [[UIButton alloc] init];
    [updateBtn setTitle:@"更新" forState:UIControlStateNormal];
    updateBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [updateBtn addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:updateBtn];
    [updateBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView.centerY);
        make.left.equalTo(deleteBtn.right).offset(30);
    }];
    
    //批量处理
    UIButton *mutilBtn = [[UIButton alloc] init];
    [mutilBtn setTitle:@"批量操作" forState:UIControlStateNormal];
    mutilBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [mutilBtn addTarget:self action:@selector(mutilDeal) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:mutilBtn];
    [mutilBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView.centerY);
        make.left.equalTo(updateBtn.right).offset(30);
    }];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60+self.toolbar.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height-60-self.toolbar.bounds.size.height) style:UITableViewStylePlain];
    [tableView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:tableView];
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    // 允许在编辑模式进行多选操作
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
}

- (void)add
{
    MSDeal *deal = [[MSDeal alloc] init];
    deal.title = @"xxxx小卖部";
    deal.price = @"66";
    deal.buyCount = @"0";
    deal.icon = @"9b437cdfb3e3b542b5917ce2e9a74890";
    [self.deals insertObject:deal atIndex:0];
    [self.tableView insertRowsAtIndexPaths:@[
                                              [NSIndexPath indexPathForRow:0 inSection:0]
                                              ]
                          withRowAnimation:UITableViewRowAnimationLeft];
//    [self.tableView reloadData];
}

- (void)delete
{
    [self.deals removeObjectAtIndex:0];
    [self.tableView deleteRowsAtIndexPaths:@[
                                             [NSIndexPath indexPathForRow:0 inSection:0]
                                             ]
                          withRowAnimation:UITableViewRowAnimationLeft];
//    [self.tableView reloadData];
}

- (void)update
{
    MSDeal *deal = _deals[3];
    deal.price = [NSString stringWithFormat:@"%d" , 50 + arc4random_uniform(100)];
    [self.tableView reloadRowsAtIndexPaths:@[
                                             [NSIndexPath indexPathForRow:3 inSection:0]
                                             ]
                          withRowAnimation:UITableViewRowAnimationFade];
//    [self.tableView reloadData];
}

- (void)mutilDeal
{
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.deals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DealCell *cell = [DealCell dealWithTableView:tableView];
    cell.deal = _deals[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        MSDeal *deal = _deals[indexPath.row];
        [_deals removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}
@end
