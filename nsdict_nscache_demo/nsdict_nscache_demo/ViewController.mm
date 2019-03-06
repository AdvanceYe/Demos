//
//  ViewController.m
//  nsdict_nscache_demo
//
//  Created by Ye Ye on 2019/3/6.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

void SetClassTest(id obj, NSMutableDictionary<Class, NSString *> *dict) {
    __unsafe_unretained Class currentClass = object_getClass(obj);
    dict[currentClass] = @"???";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *x = @{@"1":@"heihei"};
    NSString *key = @"heiheihei";
    NSMutableDictionary *dic = [NSMutableDictionary new];
    dic[key] = x;
    
    Class cls = [ViewController class];
//    dic[cls] = @"啥?";
    SetClassTest(self, dic);
    dic[@"en"] = @"啥?";
    
    NSLog(@"__dict = %@", dic);
    
    NSLog(@"___dic[heihei].pointer = %p", dic[@"heihei"]);
    NSLog(@"___x.pointer = %p", dic[@"heihei"]);
}


@end
