//
//  FourthViewController.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/18.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "FourthViewController.h"
#import "DealViewController.h"
@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startToDealControll:(id)sender {
    DealViewController *vc = [[DealViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}
@end
