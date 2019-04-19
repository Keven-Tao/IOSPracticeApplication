//
//  FirstViewController.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/18.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "FirstViewController.h"
#import "UILabel+MSExtension.h"
@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UILabel *msLabel;
@property (strong, nonatomic) IBOutlet UIButton *changeLabelBtn;
@property (strong, nonatomic) IBOutlet UIButton *myBtn;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initBtn];
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
    NSString *labelContent = @"我是新的label";
    CGFloat width = [UILabel getWidthWithTitle:labelContent font:[UIFont systemFontOfSize:20]];
    CGFloat height = [UILabel getHeightByWidth:width title:labelContent font:[UIFont systemFontOfSize:20]];
    UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, width, height)];
    [newLabel setText:labelContent];
    [newLabel setTextColor:[UIColor orangeColor]];
    [newLabel setFont:[UIFont systemFontOfSize:20]];
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

- (void)initBtn
{
    //1.代码创建UIButton
    UIButton *newBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 190, 50)];
    //2.设置按钮文字
    [self.myBtn setTitle:@"设置了文字" forState:UIControlStateNormal];
    [self.myBtn setTitle:@"按钮高亮" forState:UIControlStateHighlighted];
    //3.设置按钮中文字颜色
    [self.myBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.myBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    //4.设置按钮中的图片
    [self.myBtn setImage:[UIImage imageNamed:@"nav_coin_icon"] forState:UIControlStateNormal];
    [self.myBtn setImage:[UIImage imageNamed:@"nav_coin_icon_click"] forState:UIControlStateHighlighted];
    //5.设置按钮中的背景图片
//    [self.myBtn setBackgroundImage:[UIImage imageNamed:@"mine-sun-icon"] forState:UIControlStateNormal];
    //6.设置按钮的背景颜色
//    [self.myBtn setBackgroundColor:[UIColor redColor]];
    
    
    /*
     *  7.显示带属性的标题（例如下划线，或者字体多种颜色等等）
     */
//    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:@"设置了文字"];
//    //设置局部文字颜色
//    [attriString addAttribute:NSForegroundColorAttributeName
//                        value:[UIColor greenColor]
//                        range:NSMakeRange(1, 2)];
//    //设置下划线
//    [attriString addAttribute:NSUnderlineStyleAttributeName
//                        value:@(NSUnderlineStyleSingle)
//                        range:NSMakeRange(1, 2)];
//    //设置下划线颜色...
//    [attriString addAttribute:NSUnderlineColorAttributeName value:[UIColor redColor] range:NSMakeRange(1, 2)];
//    [self.myBtn setAttributedTitle:attriString forState:UIControlStateNormal];//---------2
//    attriString = nil;
    
    /*
     * 8
     * 默认情况下，当按钮高亮的情况下，图像的颜色会被画深一点，如果adjustsImageWhenHighlighted属性设置为no，那么可以去掉这个功能
     * 一样，默认情况下，当按钮禁用的时候，图像会被画得深一点，设置adjustsImageWhenDisabled属性为NO可以取消设置
     */
//    self.myBtn.adjustsImageWhenHighlighted = NO;
//    self.myBtn.adjustsImageWhenDisabled = NO;
    
    //9.当showsTouchWhenHighlighted设置为yes的状态下，按钮按下会发光
//    self.myBtn.showsTouchWhenHighlighted = YES;
}
@end
