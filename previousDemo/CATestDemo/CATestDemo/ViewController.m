//
//  ViewController.m
//  CATestDemo
//
//  Created by yeye(* ￣＾￣) on 2019/1/29.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    testLabel.text = @"noinowjfw";
    testLabel.layer.shadowOffset = CGSizeMake(0, 2);
    testLabel.layer.shadowOpacity = 0.5;
    
    testLabel.layer.shouldRasterize = YES;
    testLabel.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [self.view addSubview:testLabel];
    
}


@end
