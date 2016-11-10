//
//  MCMultipleImageViewController.h
//  Test
//
//  Created by MingleChang on 16/11/10.
//  Copyright © 2016年 MingleChang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCMultipleImageViewController : UIViewController

@property(nonatomic,copy)NSArray<UIImage *> *imageArray;
//@property(nonatomic,copy)NSArray<NSString *> *imageUrlArray;

@property(nonatomic,assign)NSUInteger defaultIndex;

@end
