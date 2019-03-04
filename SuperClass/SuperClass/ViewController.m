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

    [self test1];
    
//    [self testClass];
//
//    [self testSEL];
}

- (void)test1 {
    TestObject *testObj = [TestObject new];
    Class cls1 = [testObj class];
    Class cls2_1 = object_getClass(testObj);
    Class cls2 = object_getClass(cls1);
    Class cls3 = object_getClass(cls2);
    Class cls3_1 = object_getClass(cls3);
    
    Class cls4 = [TestObject class];
    Class cls5 = object_getClass([TestObject class]);
    
    
    /*
     2019-03-04 18:24:22.949980+0800 SuperClass[1891:27324] cls = TestObject, pointer = 0x10eda1008, isMeta = 0
     2019-03-04 18:24:22.950133+0800 SuperClass[1891:27324] cls = TestObject, pointer = 0x10eda1008, isMeta = 0
     2019-03-04 18:24:22.950288+0800 SuperClass[1891:27324] cls = TestObject, pointer = 0x10eda0fe0, isMeta = 1
     2019-03-04 18:24:22.950428+0800 SuperClass[1891:27324] cls = NSObject, pointer = 0x110618ee8, isMeta = 1
     2019-03-04 18:24:22.950577+0800 SuperClass[1891:27324] cls = NSObject, pointer = 0x110618ee8, isMeta = 1
     2019-03-04 18:24:22.950704+0800 SuperClass[1891:27324] cls = TestObject, pointer = 0x10eda1008, isMeta = 0
     2019-03-04 18:24:22.950857+0800 SuperClass[1891:27324] cls = TestObject, pointer = 0x10eda0fe0, isMeta = 1
     
     总结：
     Class = [instance class] / [ClassName class] / object_getClass(instance),  isMeta = NO;
     Meta Class = object_getClass(Class), isMeta = YES..
     Super Meta Class = object_getClass(Meta Class), isMeta = YES..
     ...
     Class变为NSObject
     NSObject自己的metaClass又变成自己..
     
     */
    [self printIsMeta:cls1];
    [self printIsMeta:cls2_1];
    [self printIsMeta:cls2];
    [self printIsMeta:cls3];
    [self printIsMeta:cls3_1];
    [self printIsMeta:cls4];
    [self printIsMeta:cls5];
}

- (void)printIsMeta:(Class)cls {
    BOOL isMeta = class_isMetaClass(cls);
    NSLog(@"cls = %@, pointer = %p, isMeta = %d", cls, cls, isMeta);
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
