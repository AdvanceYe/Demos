//
//  main.m
//  thread_max_count_demo
//
//  Created by yeye(* ￣＾￣) on 2018/12/5.
//  Copyright © 2018年 ye ye. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

void *thread_function(void *arg);

char message[] = "Hello World";


void *thread_function(void *arg) {
    //    printf("thread_function is running. Argument was %s\n", (char *)arg);
    sleep(1000);
    pthread_exit("Thank you for the CPU time");
}

int main(int argc, char * argv[]) {
    
    @autoreleasepool {
        int res;
        pthread_t a_thread;
        void *thread_result;
        int thread_num = 0;
        while(1)
        {
            res = pthread_create(&a_thread, NULL, thread_function, (void *)message);
            if (res != 0) {
                perror("Thread creation failed");
                break;
            }
            thread_num++;
        }
        printf("thread_num = %d\n", thread_num);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
