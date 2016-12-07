//
//  MCImageScrollView.m
//  ImagePreview
//
//  Created by 常峻玮 on 16/12/7.
//  Copyright © 2016年 MingleChang. All rights reserved.
//

#import "MCImageScrollView.h"

@interface MCImageScrollView () <UIScrollViewDelegate>

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation MCImageScrollView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutImageViewFrame];
}

#pragma mark - Configure
- (void)configure {
    [self configureView];
    [self configureData];
}

- (void)configureView {
    self.maximumZoomScale = 2.0;
    self.minimumZoomScale = 1.0;
    self.showsHorizontalScrollIndicator=NO;
    self.showsVerticalScrollIndicator=NO;
    self.delegate = self;
    
    self.imageView=[[UIImageView alloc]init];
    self.imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageView];
    [self configureImageViewConstraint];
    
    UITapGestureRecognizer *lTapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapGestureRecognizerEvent:)];
    lTapGesture.numberOfTapsRequired=2;
    [self addGestureRecognizer:lTapGesture];
}

- (void)configureData {
    
}

/**
 设置ImageView的约束，与ScrollView等宽等高
 */
-(void)configureImageViewConstraint {
    self.imageView.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *lTopConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lBottomConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lLeadingConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lTrailingConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lHeightConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    NSLayoutConstraint *lWidthConstraint=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self addConstraints:@[lTopConstraint,lBottomConstraint,lLeadingConstraint,lTrailingConstraint,lHeightConstraint,lWidthConstraint]];
}

#pragma mark - Event Response
-(void)doubleTapGestureRecognizerEvent:(UITapGestureRecognizer *)sender {
    //双击手势出发后，放大或者缩小ScrollView
    if (self.zoomScale>1.5) {
        [self setZoomScale:1.0 animated:YES];
    }else{
        [self setZoomScale:2.0 animated:YES];
    }
}

#pragma mark - Delegate
#pragma mark - ScrollView Delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {
    
}

#pragma mark - Private
- (void)layoutImageViewFrame {
    CGFloat scale = self.zoomScale;
    CGFloat width = self.frame.size.width * scale;
    CGFloat height = MAX(self.imageView.image.size.height/self.imageView.image.size.width * width, self.frame.size.height);
    CGRect lRect = self.imageView.frame;
    lRect.size.width = width;
    lRect.size.height = height;
    self.imageView.frame = lRect;
    self.contentSize = lRect.size;
}

#pragma mark - Public 
- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
