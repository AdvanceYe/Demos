//
//  ViewController.m
//  SuperClass
//
//  Created by yeye(* ￣＾￣) on 2019/2/17.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestObject *testObj = [TestObject new];
    
    NSLog(@"cls = %@, isMeta = %d", object_getClass(testObj), class_isMetaClass(object_getClass(testObj)));
    NSLog(@"currentClass = %@, isMeta = %d", object_getClass([testObj class]),
          class_isMetaClass(object_getClass([testObj class])));
    
    Class currentClass = [[testObj class] class];
    do {
        NSLog(@"current class = %@", currentClass);
        NSLog(@"super = %@", class_getSuperclass(currentClass));
    } while ((currentClass = class_getSuperclass(currentClass)));
    
    
    [self testClass];
    
    [self testSEL];
}

- (void)testClass {
    TestObject *testObj = [TestObject new];
    
    __unused Class statedClass = testObj.class;
    Class baseClass = object_getClass(testObj);
    NSLog(@">>> 1 ismeta = %d", class_isMetaClass(baseClass));
    //statedClass = 0x101035f10, baseClass = 0x101035f10
    NSLog(@"statedClass = %p, baseClass = %p", statedClass, baseClass);
    if (statedClass == baseClass) {
        NSLog(@"是obj");
    }
    
    
    __unused Class statedClass2 = [testObj class].class;
    Class baseClass2 = object_getClass([testObj class]);
    NSLog(@">>> 2 ismeta = %d", class_isMetaClass(baseClass2));
    //statedClass2 = 0x101035f10, baseClass2 = 0x101035ee8
    NSLog(@"statedClass2 = %p, baseClass2 = %p", statedClass2, baseClass2);
    if (statedClass2 != baseClass2) {
        NSLog(@"是class");
    }
    
    NSLog(@"___");
    
    
}

- (void)testSEL {
    SEL x = NSSelectorFromString(@"hahaha");
    SEL y = NSSelectorFromString(@"hahaha");
    if (x == y) {
        NSLog(@"相等吗");
    }
}


@end
