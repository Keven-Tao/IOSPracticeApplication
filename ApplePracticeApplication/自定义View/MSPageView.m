//
//  MSPageView.m
//  ApplePracticeApplication
//
//  Created by KevenTao on 2019/4/24.
//  Copyright © 2019 KevenTao. All rights reserved.
//

#import "MSPageView.h"

@interface MSPageView()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *myPageControl;
@property (nonatomic,strong) NSTimer *timer;//定时器
@end

@implementation MSPageView

//类构造器
+(instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

#pragma mark - 初始化方法
/**
 * 当控件通过代码创建时，就会调用这个方法
 * 当控件通过代码创建时，想做一些初始化操作。应该在这个方法中执行
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

/**
 * 当控件从xib\storyboard中创建完毕时，就会调用这个方法
 * 当控件从xib\storyboard中创建完毕后的初始化操作。应该在这个方法中执行
 */
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

/**
 * 初始化代码
 */
- (void)setUp
{
    _scrollView.backgroundColor = [UIColor redColor];
    
    // 开启定时器
    [self startTimer];
}

/**
 * 当控件的尺寸发生改变的时候，会自动调用这个方法
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置scrollview的frame
    _scrollView.frame = self.bounds;
    
    //获得scrollview的尺寸
    CGFloat scrollW = _scrollView.frame.size.width;
    CGFloat scrollH = _scrollView.frame.size.height;
    
    // 设置pageControl
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    CGFloat pageX = scrollW - pageW;
    CGFloat pageY = scrollH - pageH;
    _myPageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    
    //设置内容大小
    _scrollView.contentSize = CGSizeMake(scrollW * _imageNames.count, 0);
    
    _scrollView.pagingEnabled=YES;//scrollView不会停在页面之间，即只会显示第一页或者第二页，不会各一半显示
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    //设置所有imageView的frame
    for (int index = 0; index < _scrollView.subviews.count; index++) {
        UIImageView *imageView = _scrollView.subviews[index];
        imageView.frame = CGRectMake(scrollW * index, 0, scrollW, scrollH);
    }
}

#pragma mark - 设置资源图片数组
- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    //移除之前所有的imageview
    //让subviews数组中的所有对象都执行removeFromSuperview方法
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //根据图片名创建对应个数的imageview
    for (int index=0; index<imageNames.count; index++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNames[index]]];
        [self.scrollView addSubview:imageView];
    }
    
    //设置总页数
    _myPageControl.numberOfPages = imageNames.count;
}

#pragma mark - 设置选中时圆点的颜色
- (void)setCurrentColor:(UIColor *)currentColor
{
    _currentColor = currentColor;
    _myPageControl.currentPageIndicatorTintColor = currentColor;
}

#pragma mark - 设置未选中时圆点的颜色
- (void)setOtherColor:(UIColor *)otherColor
{
    _otherColor = otherColor;
    _myPageControl.pageIndicatorTintColor = otherColor;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _myPageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

#pragma mark - 定时器控制
- (void)startTimer
{
    // 创建一个定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

/**
 * 下一页
 */
- (void)nextPage
{
    NSInteger page = _myPageControl.currentPage + 1;
    if (page == _myPageControl.numberOfPages) {
        page = 0;
    }
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:offset animated:YES];   // animate at constant velocity to new offset
    NSLog(@"nextPage");
}
@end
