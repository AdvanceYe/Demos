//
//  ViewController.m
//  obj_enumerator
//
//  Created by Ye Ye on 2019/3/2.
//  Copyright © 2019 Ye Ye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSEnumerator *enumerator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupSet];
    
    [self setupArray];
}

- (void)setupSet {
    NSMutableSet *set = [NSMutableSet new];
    id obj1 = [NSObject new];
    id obj2 = [UIView new];
    id obj3 = [NSArray new];
    id obj4 = obj3;
    
    [set addObject:obj1];
    [set addObject:obj2];
    [set addObject:obj3];
    [set addObject:obj4];
    
    NSLog(@"set.all = %@", [set allObjects]);
    
    self.enumerator = [set objectEnumerator];
    
    id obj = [self.enumerator nextObject];
    while (obj) {
        NSLog(@"obj = %@", obj);
        obj = [self.enumerator nextObject];
    }
}

- (void)setupArray {
    NSMutableArray *array = [NSMutableArray new];
    id obj1 = [NSObject new];
    id obj2 = [UIView new];
    id obj3 = [NSArray new];
    id obj4 = obj3;
    
    [array addObject:obj1];
    [array addObject:obj2];
    [array addObject:obj3];
    [array addObject:obj4];
    
    NSLog(@"set.all = %@", array);
    
    self.enumerator = [array objectEnumerator];
    
    id obj = [self.enumerator nextObject];
    while (obj) {
        NSLog(@"obj = %@", obj);
        obj = [self.enumerator nextObject];
    }
}

@end
