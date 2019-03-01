//
//  ViewController.m
//  AOP_demo
//
//  Created by yeye(* ￣＾￣) on 2019/1/1.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "ViewController.h"
#import "TestObj1.h"
#import <Aspects.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestObj1 *obj1 = [TestObj1 new];
    
    [obj1 aspect_hookSelector:@selector(doSth) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo){
        NSLog(@">>> 执行之前");
    } error:NULL];

    [obj1 aspect_hookSelector:@selector(doSth) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
        NSLog(@">>> 执行之后");
    } error:NULL];
    
    [obj1 doSth];
}


@end
