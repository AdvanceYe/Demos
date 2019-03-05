//
//  ViewController.m
//  touch_gesture_demo
//
//  Created by Ye Ye on 2019/3/4.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomView *cusView = [CustomView new];
    cusView.frame = CGRectMake(20, 20, 100, 100);
    [self.view addSubview:cusView];
    
    CustomView *subView = [CustomView new];
    subView.frame = CGRectMake(0, 0, 50, 50);
    subView.center = CGPointMake(50, 50);
    subView.backgroundColor = [UIColor greenColor];
    [cusView addSubview:subView];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@">>> began");
//}


@end
