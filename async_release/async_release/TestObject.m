//
//  TestObject.m
//  async_release
//
//  Created by Ye Ye on 2019/3/6.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

- (void)dealloc {
    NSLog(@"___current thread = %@", [NSThread currentThread]);
    
}

@end
