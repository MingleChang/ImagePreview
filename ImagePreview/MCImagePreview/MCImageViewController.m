//
//  MCImageViewController.m
//  Test
//
//  Created by MingleChang on 16/11/10.
//  Copyright © 2016年 MingleChang. All rights reserved.
//

#import "MCImageViewController.h"

@interface MCImageViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scollView;

@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation MCImageViewController

-(void)dealloc{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
    // Do any additional setup after loading the view.
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
    self.view.backgroundColor=[UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    //创建ScrollView
    self.scollView=[[UIScrollView alloc]init];
    self.scollView.maximumZoomScale = 2.0;
    self.scollView.minimumZoomScale = 1.0;
    self.scollView.showsHorizontalScrollIndicator=NO;
    self.scollView.showsVerticalScrollIndicator=NO;
    self.scollView.delegate = self;
    [self.view addSubview:self.scollView];
    [self configureScrollViewConstraint];
    //创建ImageView
    self.imageView=[[UIImageView alloc]init];
    self.imageView.image=self.image;
    self.imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.scollView addSubview:self.imageView];
    [self configureImageViewConstraint];
    //双击手势
    UITapGestureRecognizer *lTapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapGestureRecognizerEvent:)];
    lTapGesture.numberOfTapsRequired=2;
    [self.view addGestureRecognizer:lTapGesture];
}
-(void)configureData{
    
}

#pragma mark - Constraint
/**
 设置ScrollView的约束，填充满全屏
 */
-(void)configureScrollViewConstraint{
    self.scollView.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *lTopConstraint=[NSLayoutConstraint constraintWithItem:self.scollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lBottomConstraint=[NSLayoutConstraint constraintWithItem:self.scollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lLeadingConstraint=[NSLayoutConstraint constraintWithItem:self.scollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lTrailingConstraint=[NSLayoutConstraint constraintWithItem:self.scollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    [self.view addConstraints:@[lTopConstraint,lBottomConstraint,lLeadingConstraint,lTrailingConstraint]];
}
/**
 设置ImageView的约束，与ScrollView等宽等高
 */
-(void)configureImageViewConstraint{
    self.imageView.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *lTopConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scollView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lBottomConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scollView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lLeadingConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scollView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lTrailingConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scollView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lHeightConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    NSLayoutConstraint *lWidthConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scollView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.scollView addConstraints:@[lTopConstraint,lBottomConstraint,lLeadingConstraint,lTrailingConstraint,lHeightConstraint,lWidthConstraint]];
}

#pragma mark - Event Response
-(void)doubleTapGestureRecognizerEvent:(UITapGestureRecognizer *)sender{
    //双击手势出发后，放大或者缩小ScrollView
    if (self.scollView.zoomScale>1.5) {
        [self.scollView setZoomScale:1.0 animated:YES];
    }else{
        [self.scollView setZoomScale:2.0 animated:YES];
    }
    
}
#pragma mark - Delegate
#pragma mark - ScrollView Delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view{
    
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    
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
