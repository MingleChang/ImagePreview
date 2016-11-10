//
//  ViewController.m
//  ImagePreview
//
//  Created by MingleChang on 16/11/10.
//  Copyright © 2016年 MingleChang. All rights reserved.
//

#import "ViewController.h"
#import "MCImageViewController.h"
#import "MCMultipleImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(UIButton *)sender {
    NSMutableArray *lImageArray=[NSMutableArray arrayWithCapacity:5];
    for (int i=1; i<=5; i++) {
        UIImage *lImage=[UIImage imageNamed:@(i).stringValue];
        [lImageArray addObject:lImage];
    }
    MCMultipleImageViewController *lViewController=[[MCMultipleImageViewController alloc]init];
    lViewController.imageArray=lImageArray;
    lViewController.defaultIndex=3;
    [self.navigationController pushViewController:lViewController animated:YES];
}

@end
