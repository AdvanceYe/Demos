//
//  ViewController.m
//  oc高级编程_block
//
//  Created by yeye(* ￣＾￣) on 2018/11/1.
//  Copyright © 2018年 ye ye. All rights reserved.
//

#import "ViewController.h"

typedef void (^blk_t)(id);
typedef id (^blk_n)(void);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    blk_t blk;
    blk_n blk_2;
    {
        id array = [[NSMutableArray alloc] init];
//        blk = [^(id obj) {
//
//            [array addObject:obj];
//
//            NSLog(@"array count = %ld", [array count]);
//
//        } copy];
        blk = ^(id obj) {
            [array addObject:obj];
            NSLog(@"array count = %ld", [array count]);
        };
        
        blk_2 = ^ {
            return array;
        };
    }
    blk([NSObject new]);
    blk([NSObject new]);
    blk([NSObject new]);
    
    NSArray *array = blk_2();
    NSLog(@"array = %@", array);
    NSLog(@"arr1 = %@", array[0]);
}


@end
