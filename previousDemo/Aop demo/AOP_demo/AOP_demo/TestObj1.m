//
//  TestObj1.m
//  AOP_demo
//
//  Created by yeye(* ￣＾￣) on 2019/1/1.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "TestObj1.h"
#import "TestObj2.h"

@implementation TestObj1

- (instancetype)init {
    self = [super init];
    if (self) {
        self.obj2 = [TestObj2 new];
    }
    return self;
}

- (void)doSth {
    NSLog(@">>> 开始执行");
    [self.obj2 doSth];
}

@end
