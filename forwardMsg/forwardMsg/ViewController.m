//
//  ViewController.m
//  forwardMsg
//
//  Created by yeye(* ￣＾￣) on 2019/2/16.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "ViewController.h"
#import "TestObj.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[TestObj new] what];
    [[TestObj new] what2];
    [[TestObj new] what3];
//    [TestObj class_what];
    
}


@end
