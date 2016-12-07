//
//  MCImageViewController.m
//  Test
//
//  Created by MingleChang on 16/11/10.
//  Copyright © 2016年 MingleChang. All rights reserved.
//

#import "MCImageViewController.h"
#import "MCImagePreview.h"

@interface MCImageViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)MCImageScrollView *scollView;

@end

@implementation MCImageViewController

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
- (void)configure {
    [self configureView];
    [self configureData];
}
- (void)configureView {
    self.view.backgroundColor=[UIColor blackColor];
    //创建ScrollView
    self.scollView=[[MCImageScrollView alloc]init];
    [self.scollView setImage:self.image];
    [self.view addSubview:self.scollView];
    [self configureScrollViewConstraint];
}
- (void)configureData {
    
}

#pragma mark - Constraint
/**
 设置ScrollView的约束，填充满全屏
 */
-(void)configureScrollViewConstraint {
    self.scollView.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *lTopConstraint=[NSLayoutConstraint constraintWithItem:self.scollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lBottomConstraint=[NSLayoutConstraint constraintWithItem:self.scollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lLeadingConstraint=[NSLayoutConstraint constraintWithItem:self.scollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lTrailingConstraint=[NSLayoutConstraint constraintWithItem:self.scollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    [self.view addConstraints:@[lTopConstraint,lBottomConstraint,lLeadingConstraint,lTrailingConstraint]];
}

@end
