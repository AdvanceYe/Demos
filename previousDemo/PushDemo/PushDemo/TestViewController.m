//
//  TestViewController.m
//  PushDemo
//
//  Created by yeye(* ￣＾￣) on 2019/1/18.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    testView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:testView];
    
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
