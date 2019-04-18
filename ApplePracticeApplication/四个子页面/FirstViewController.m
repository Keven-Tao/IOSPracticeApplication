//
//  FirstViewController.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/18.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UILabel *msLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - 点击按钮改变label内容
- (IBAction)changeLabel:(id)sender {
    /*------------------------------------------以下需要掌握---------------------------------------------*/
    //改变文字内容
    [_msLabel setText:@"我被改变了"];
    //改变文字颜色
    [_msLabel setTextColor:[UIColor greenColor]];
    //改变字体大小
    [_msLabel setFont:[UIFont systemFontOfSize:16]];
    //改变字体排列方式 居左NSTextAlignmentLeft\居中NSTextAlignmentCenter\居右NSTextAlignmentRight
    self.msLabel.textAlignment = NSTextAlignmentCenter;
    //设置字体阴影颜色
    [self.msLabel setShadowColor:[UIColor blueColor]];
    //设置字体阴影偏移量
    [self.msLabel setShadowOffset:CGSizeMake(0, -2)];
    //设置行数(当文本需要自适应时，需将行数设置为0)
    self.msLabel.numberOfLines = 0;
    //adjustsFontSizeToFitWidth根据宽度调整font,默认为 NO
    self.msLabel.adjustsFontSizeToFitWidth = YES;
    
    //代码添加label
    UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 400, 100)];
    [newLabel setText:@"我是新的label"];
    [newLabel setTextColor:[UIColor orangeColor]];
    [self.view addSubview:newLabel];
    
    /*-----------------------------------------以下作了解----------------------------------------------*/
    //设置是否处于高亮状态
//    self.msLabel.highlighted = YES;
    //设置高亮状态字体的颜色
//    _msLabel.highlightedTextColor = [UIColor blueColor];
    //设置能否进行用户交互(默认为NO)
//    label.userInteractionEnabled = YES;
    //此属性只决定如何绘制标签。禁用的文本有些模糊，表示它不活跃。默认情况下，此属性被设置为yes。
//    _msLabel.enabled = NO;
}
@end
