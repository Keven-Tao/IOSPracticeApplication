//
//  ThirdViewController.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/18.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "ThirdViewController.h"
#import "MSHero.h"
@interface ThirdViewController ()<UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *heroes;//英雄数组
@end

@implementation ThirdViewController

- (NSArray *)heroes
{
    if (_heroes == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heroes.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *heroArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MSHero *hero = [MSHero heroWithDict:dict];
            [heroArray addObject:hero];
        }
        
        _heroes = heroArray;
    }
    return _heroes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置数据源
    _tableView.dataSource = self;
}

#pragma mark - <UITableViewDataSource>
/**
 *  告诉tableView第section组有多少行
 */
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 4;
//}

/**
 *  告诉tableView一共有多少组数据
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"heros";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    MSHero *hero = self.heroes[indexPath.row];
    
    cell.textLabel.text = hero.name;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    cell.detailTextLabel.text = hero.intro;
    return cell;
}

/**
 *  告诉tableView第section组的头部标题
 */
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return @"德系";
//    } else if (section == 1) {
//        return @"日系";
//    } else if (section == 2) {
//        return @"天系";
//    } else {
//        return @"意系";
//    }
//}

/**
 *  告诉tableView第section组的尾部标题
 */
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return @"德系车6666";
//    } else if (section == 1) {
//        return @"日系车日系车日系车日系车日系车日系车日系车日系车日系车日系车SB";
//    } else if (section == 2) {
//        return @"天系车NNNN";
//    } else {
//        return @"意系车NNNN";
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
