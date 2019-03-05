//
//  ViewController.m
//  Property_demo
//
//  Created by Ye Ye on 2019/3/5.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "ViewController.h"
#import "PropertyTestObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PropertyTestObject *testObj = [PropertyTestObject new];
    
    [testObj getInfo_objc_property];
    NSLog(@"\n\n");
    
    [testObj getInfo_ivar];
    NSLog(@"\n\n");
    
    [testObj getInfo_methods];
    
}


@end
