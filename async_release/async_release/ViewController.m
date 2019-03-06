//
//  ViewController.m
//  async_release
//
//  Created by Ye Ye on 2019/3/6.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"

@interface ViewController ()

@end

@implementation ViewController
{
    dispatch_queue_t _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _queue = dispatch_queue_create("com.rjoeye.test", DISPATCH_QUEUE_SERIAL);
    
    [self testAsyncRelease];
    
    [self testSyncRelease];
}

- (void)testAsyncRelease {
    TestObject *testObj = [TestObject new];
    NSLog(@"____ _queue = %p", _queue);
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSLog(@"____ runloop1 = %@", runloop);
    
    dispatch_async(_queue, ^{
        // 每个线程都有个runloop对象。。Each NSThread object—including the application’s main thread—has an NSRunLoop object automatically created for it as needed.
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        NSLog(@"____ runloop2 = %@", runloop);
        
        [testObj class];
    });
    //总结：先返回了, 在_queue中释放
}

- (void)testSyncRelease {
    TestObject *testObj = [TestObject new];
    dispatch_sync(_queue, ^{
        [testObj class];
    });
    //总结：等_queue中完成了再返回，在main thread释放
}

@end
