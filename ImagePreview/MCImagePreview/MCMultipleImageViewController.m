//
//  MCMultipleImageViewController.m
//  Test
//
//  Created by MingleChang on 16/11/10.
//  Copyright © 2016年 MingleChang. All rights reserved.
//

#import "MCMultipleImageViewController.h"
#import "MCImageViewController.h"

@interface MCMultipleImageViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property(nonatomic,strong)UIPageViewController *pageViewController;

@property(nonatomic,assign)NSUInteger currentIndex;

@end

@implementation MCMultipleImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configure];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configure
-(void)configure{
    [self configureView];
    [self configureData];
}
-(void)configureView{
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.view.backgroundColor = [UIColor clearColor];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    [self configurePageViewConstraint];
}
-(void)configureData{
    self.currentIndex=self.defaultIndex;
    if (self.currentIndex>=self.imageArray.count-1) {
        self.currentIndex=0;
    }
    MCImageViewController *lViewController=[self imageViewControllerWithIndex:self.currentIndex];
    [self.pageViewController setViewControllers:@[lViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

#pragma mark - Constraint
/**
 设置PageViewController.view的约束，填充满全屏
 */
-(void)configurePageViewConstraint{
    self.pageViewController.view.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *lTopConstraint=[NSLayoutConstraint constraintWithItem:self.pageViewController.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lBottomConstraint=[NSLayoutConstraint constraintWithItem:self.pageViewController.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lLeadingConstraint=[NSLayoutConstraint constraintWithItem:self.pageViewController.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lTrailingConstraint=[NSLayoutConstraint constraintWithItem:self.pageViewController.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    [self.view addConstraints:@[lTopConstraint,lBottomConstraint,lLeadingConstraint,lTrailingConstraint]];
}

#pragma mark - Private

/**
 根据index创建MCImageViewController
 先创建MCImageViewController，然后根据index初始化MCImageViewController的image或者imageUrl

 @param index NSUInteger，对应需要展示图片的index

 @return MCImageViewController，创建的一个新的MCImageViewController对象
 */
-(MCImageViewController *)imageViewControllerWithIndex:(NSUInteger)index{
    MCImageViewController *lViewController=[[MCImageViewController alloc]init];
    lViewController.index=index;
    lViewController.image=self.imageArray[index];
    return lViewController;
}

#pragma mark - Delegate
#pragma mark - UIPageViewController DataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    if (self.currentIndex<=0) {
        return nil;
    }else{
        NSUInteger index=self.currentIndex-1;
        MCImageViewController *lViewController=[self imageViewControllerWithIndex:index];
        return lViewController;
    }
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    if (self.currentIndex>=self.imageArray.count-1) {
        return nil;
    }else{
        NSUInteger index=self.currentIndex+1;
        MCImageViewController *lViewController=[self imageViewControllerWithIndex:index];
        return lViewController;
    }
}
#pragma mark - UIPageViewController Delegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    MCImageViewController *lViewController=(MCImageViewController *)pendingViewControllers.firstObject;
    self.currentIndex=lViewController.index;
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
