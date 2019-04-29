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

@interface DealViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *deals;
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
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:tableView];
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
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
@end
