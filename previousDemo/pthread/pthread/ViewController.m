//
//  ViewController.m
//  pthread
//
//  Created by yeye(* ￣＾￣) on 2019/1/13.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@property(nonatomic, copy) NSString *rwStr;

@end

@implementation ViewController

pthread_rwlock_t rwlock;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 初始化读写锁
    pthread_rwlock_init(&rwlock,NULL);
    
//    [self readWriteTest];
    
    /*
     https://blog.csdn.net/zouxinfox/article/details/5838861
     读锁是递归锁，写锁是非递归锁。
     */
    [self test1];
    [self test2];
}

- (void)test1 {
    pthread_rwlock_rdlock(&rwlock);
    pthread_rwlock_wrlock(&rwlock);
    pthread_rwlock_unlock(&rwlock);
    pthread_rwlock_unlock(&rwlock);
    NSLog(@">>> 完成_ %@", NSStringFromSelector(_cmd));
}

- (void)test2 {
    pthread_rwlock_wrlock(&rwlock);
    pthread_rwlock_rdlock(&rwlock);
    pthread_rwlock_unlock(&rwlock);
    pthread_rwlock_unlock(&rwlock);
    NSLog(@">>> 完成_ %@", NSStringFromSelector(_cmd));
}

- (void)readWriteTest {
    __block int i;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        i = 10;
        while (i>=0) {
            NSLog(@">>> 尝试读 - i = %ld", i);
            [self readingLock];
            i--;
        }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        i = 3;
        while (i>=0) {
            NSLog(@">>> 尝试写 - i = %ld", i);
            NSString *temp = [NSString stringWithFormat:@"writing == %d", i];
            [self writingLock:temp];
            i--;
        }
    });
}

// 写加锁
-(void)writingLock:(NSString *)temp{
    pthread_rwlock_wrlock(&rwlock);
    // writing
    self.rwStr = temp;
    NSLog(@"%@", temp);
    pthread_rwlock_unlock(&rwlock);
}

// 读加锁
-(NSString *)readingLock{
    pthread_rwlock_rdlock(&rwlock);
    // reading
    NSString *str = self.rwStr;
    NSLog(@"reading == %@",self.rwStr);
    pthread_rwlock_unlock(&rwlock);
    return str;
}


@end
