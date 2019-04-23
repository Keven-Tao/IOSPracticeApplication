//
//  SecondViewController.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/18.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "SecondViewController.h"
/**
 * 使用scrollview的时候必须要实现UIScrollViewDelegate
 */
@interface SecondViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置控制器为scrollView的代理
    _myScrollView.delegate = self;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"landing_background"]];
    [_myScrollView addSubview:imageView];
    self.imageView = imageView;
    
    //********设置内容展示区域（必须要设置，否则无法拖动）
    _myScrollView.contentSize = CGSizeMake(imageView.frame.size.width, imageView.frame.size.height);
    //设置scrollview背景色
    _myScrollView.backgroundColor = [UIColor orangeColor];
    
    //最大、最小缩放
    _myScrollView.maximumZoomScale = 2.0;
    _myScrollView.minimumZoomScale = 0.2;

    //设置偏移量
    _myScrollView.contentInset = UIEdgeInsetsMake(40, 40, 10, 10);
    
    //设置scrollview移动到某个坐标（左上角为原点）
    _myScrollView.contentOffset = CGPointMake(-100, -100);
}

#pragma mark - *****缩放需要实现下面的方法（不实现无法完成缩放）
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

#pragma mark - scrollView将要开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollView将要开始拖拽");
}

#pragma mark - scrollView将要结束拖拽
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollView将要结束拖拽");
}

#pragma mark - scrollView正在拖拽
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollView正在拖拽");
}
@end
