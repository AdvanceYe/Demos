//
//  ViewController.m
//  identifierDemo
//
//  Created by yeye(* ￣＾￣) on 2019/2/19.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "ViewController.h"
#import "TestObj.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createStrong];
    
    [self createWeak];

    [self testClass];
//    [self createUnsafeUnretain_class];
//    [self createUnsafeUnretain];
//    [self createUnsafeUnretain];
}

/*
 2019-02-21 19:26:55.534051+0800 identifierDemo[26145:826772] begin - createStrong
 2019-02-21 19:26:55.534179+0800 identifierDemo[26145:826772] testObj = 0x6000002f85f0
 2019-02-21 19:26:55.534286+0800 identifierDemo[26145:826772] testObj = <TestObj: 0x6000002f85f0>
 2019-02-21 19:26:55.534375+0800 identifierDemo[26145:826772] end - createStrong
 2019-02-21 19:26:55.534444+0800 identifierDemo[26145:826772] dealloc
 */
- (void)createStrong {
    NSLog(@"begin - %@", NSStringFromSelector(_cmd));
    //__strong保证到整个代码块
    __strong TestObj *testObj = [[TestObj alloc] init];
    NSLog(@"testObj = %p", testObj);
    NSLog(@"testObj = %@", testObj);
    NSLog(@"end - %@", NSStringFromSelector(_cmd));
}

/*
 2019-02-21 19:26:55.534523+0800 identifierDemo[26145:826772] begin - createWeak
 2019-02-21 19:26:55.534632+0800 identifierDemo[26145:826772] dealloc
 2019-02-21 19:26:55.534754+0800 identifierDemo[26145:826772] testObj = 0x0
 2019-02-21 19:26:55.534841+0800 identifierDemo[26145:826772] testObj = (null)
 2019-02-21 19:26:55.534911+0800 identifierDemo[26145:826772] end - createWeak
 */
- (void)createWeak {
    NSLog(@"begin - %@", NSStringFromSelector(_cmd));
    //__weak立刻release被回收
    __weak TestObj *testObj = [[TestObj alloc] init];
    NSLog(@"testObj = %p", testObj);
    NSLog(@"testObj = %@", testObj);
    NSLog(@"end - %@", NSStringFromSelector(_cmd));
}

/*
 2019-02-21 19:26:55.535026+0800 identifierDemo[26145:826772] begin - createUnsafeUnretain
 2019-02-21 19:26:55.535112+0800 identifierDemo[26145:826772] dealloc
 2019-02-21 19:26:55.535199+0800 identifierDemo[26145:826772] testObj = 0x6000002f85f0
 */
- (void)createUnsafeUnretain {
    NSLog(@"begin - %@", NSStringFromSelector(_cmd));
    __unsafe_unretained TestObj *testObj = [[TestObj alloc] init];
    //此时也释放了
    NSLog(@"testObj = %p", testObj); //指针还在
    NSLog(@"testObj = %@", testObj);
    NSLog(@"end - %@", NSStringFromSelector(_cmd));
}

/*
 2019-02-23 17:40:43.028632+0800 identifierDemo[3504:140086] begin - createUnsafeUnretain_class
 2019-02-23 17:40:43.028704+0800 identifierDemo[3504:140086] class = 0x105a76fb0
 2019-02-23 17:40:43.028769+0800 identifierDemo[3504:140086] class->isa = 0x105a76fb0
 2019-02-23 17:40:43.028832+0800 identifierDemo[3504:140086] dealloc
 2019-02-23 17:40:43.028893+0800 identifierDemo[3504:140086] testObj = 0x105a76fd8
 2019-02-23 17:40:43.028979+0800 identifierDemo[3504:140086] testObj = TestObj
 2019-02-23 17:40:43.029067+0800 identifierDemo[3504:140086] end - createUnsafeUnretain_class
 */
- (void)createUnsafeUnretain_class {
    
    // class类真的不释放，和普通object一样。
    NSLog(@"begin - %@", NSStringFromSelector(_cmd));
    Class class = [TestObj class];
    NSLog(@"class = %p", class);
    
    //[TestObj new]->isa 改成object_getClass([TestObj new])了，等同的。
//    NSLog(@"class->isa = %p", [TestObj new]->isa);
    NSLog(@"class->isa = %p", object_getClass([TestObj new]));
    Class class1 = class_getSuperclass(class);
    Class class2 = class_getSuperclass(object_getClass([TestObj new]));
    NSLog(@"super_class1 = %p, =%@", class1, class1);
    NSLog(@"super_class2 = %p, =%@", class2, class2);
    NSLog(@"class1是meta class = %d", class_isMetaClass(class1));
    
    __unsafe_unretained Class testObjClass = object_getClass([TestObj class]);
    Class class3 = class_getSuperclass(testObjClass);
    NSLog(@"super_class3 = %p, =%@", class3, class3);
    NSLog(@"class3是meta class = %d", class_isMetaClass(class3));
    Class class4 = class_getSuperclass(class3);
    NSLog(@"super_class4 = %p, =%@", class4, class4);
    if (class1 == class3) {
        NSLog(@"class 1 == class 3");
    }
    
    NSLog(@"testObj = %p", testObjClass); //指针还在
    NSLog(@"testObj = %@", testObjClass);
    NSLog(@"end - %@", NSStringFromSelector(_cmd));
}

/*
 2019-02-23 17:57:15.564297+0800 identifierDemo[3862:156343] [testObj class] = 0x1028e10e0
 2019-02-23 17:57:15.564366+0800 identifierDemo[3862:156343] object_getClass(testObj) = 0x1028e10e0
 */
- (void)testClass {
    /*
     2019-02-23 18:09:29.474614+0800 identifierDemo[4127:168393] [testObj class] = 0x1032d21d8
     2019-02-23 18:09:29.474703+0800 identifierDemo[4127:168393] object_getClass(testObj) = 0x1032d21d8
     2019-02-23 18:09:29.474948+0800 identifierDemo[4127:168393] cl1 = 0x1032d21d8, = TestObj, 是meta class = 0
     2019-02-23 18:09:29.477283+0800 identifierDemo[4127:168393] cl2 = 0x1032d2200, = TestObj, 是meta class = 1
     2019-02-23 18:09:29.477413+0800 identifierDemo[4127:168393] cl3 = 0x10436bf38, = NSObject, 是meta class = 0
     2019-02-23 18:09:29.477516+0800 identifierDemo[4127:168393] cl4 = 0x10436bee8, = NSObject, 是meta class = 1
     2019-02-23 18:09:29.477613+0800 identifierDemo[4127:168393] cl5 = 0x0, = (null), 是meta class = 0
     2019-02-23 18:09:29.477711+0800 identifierDemo[4127:168393] cl6 = 0x10436bf38, = NSObject, 是meta class = 0
     2019-02-23 18:09:29.477797+0800 identifierDemo[4127:168393] cl7 = 0x0, = (null), 是meta class = 0
     */
    
    TestObj *testObj = [TestObj new];
    Class testObjClass = [testObj class];
    Class testObjClass2 = object_getClass(testObj);
    NSLog(@"[testObj class] = %p", testObjClass);
    NSLog(@"object_getClass(testObj) = %p", testObjClass2);
    
    Class cl1 = [testObj class];
    Class cl2 = object_getClass(cl1);
    NSLog(@"cl1 = %p, = %@, 是meta class = %d", cl1, cl1, class_isMetaClass(cl1));
    NSLog(@"cl2 = %p, = %@, 是meta class = %d", cl2, cl2, class_isMetaClass(cl2));
    
    Class cl3 = class_getSuperclass(cl1);
    Class cl4 = class_getSuperclass(cl2);
    NSLog(@"cl3 = %p, = %@, 是meta class = %d", cl3, cl3, class_isMetaClass(cl3));
    NSLog(@"cl4 = %p, = %@, 是meta class = %d", cl4, cl4, class_isMetaClass(cl4));
    
    Class cl5 = class_getSuperclass(cl3);
    Class cl6 = class_getSuperclass(cl4);
    NSLog(@"cl5 = %p, = %@, 是meta class = %d", cl5, cl5, class_isMetaClass(cl5));
    NSLog(@"cl6 = %p, = %@, 是meta class = %d", cl6, cl6, class_isMetaClass(cl6));
    
    
    Class cl7 = class_getSuperclass(cl6);
    NSLog(@"cl7 = %p, = %@, 是meta class = %d", cl7, cl7, class_isMetaClass(cl7));
    Class cl8 = class_getSuperclass(cl7);
    NSLog(@"cl8 = %p, = %@, 是meta class = %d", cl8, cl8, class_isMetaClass(cl8));
}

@end
