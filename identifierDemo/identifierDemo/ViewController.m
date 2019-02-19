//
//  ViewController.m
//  identifierDemo
//
//  Created by yeye(* ￣＾￣) on 2019/2/19.
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
    
    [self createStrong];
    
    [self createWeak];
    
    [self createUnsafeUnretain];
    
//    [self createUnsafeUnretain];
}


/*
 2019-02-19 10:06:40.817832+0800 identifierDemo[2205:30996] begin - createStrong
 2019-02-19 10:06:40.817964+0800 identifierDemo[2205:30996] testObj = <TestObj: 0x600001a907a0>
 2019-02-19 10:06:40.818047+0800 identifierDemo[2205:30996] end - createStrong
 2019-02-19 10:06:40.818109+0800 identifierDemo[2205:30996] dealloc
 */
- (void)createStrong {
    NSLog(@"begin - %@", NSStringFromSelector(_cmd));
    //__strong保证到整个代码块
    __strong TestObj *testObj = [[TestObj alloc] init];
    NSLog(@"testObj = %@", testObj);
    NSLog(@"end - %@", NSStringFromSelector(_cmd));
}

- (void)createWeak {
    NSLog(@"begin - %@", NSStringFromSelector(_cmd));
    //__weak立刻release被回收
    __weak TestObj *testObj = [[TestObj alloc] init];
    NSLog(@"testObj = %@", testObj);
    NSLog(@"end - %@", NSStringFromSelector(_cmd));
}

- (void)createUnsafeUnretain {
    NSLog(@"begin - %@", NSStringFromSelector(_cmd));
    __unsafe_unretained TestObj *testObj = [[TestObj alloc] init];
    //此时也释放了
    NSLog(@"testObj = %@", testObj);
    NSLog(@"end - %@", NSStringFromSelector(_cmd));
}

@end
