//
//  ViewController.m
//  SEL_demo
//
//  Created by Ye Ye on 2019/3/5.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BOOL resp1 = [self respondsToSelector:@selector(heiheihei1)];
    NSLog(@"resp1 = %d", resp1);
    
    BOOL resp2 = [ViewController respondsToSelector:@selector(heiheihei2)];
    NSLog(@"resp2 = %d", resp2);
}

- (void)heiheihei1 {

}

+ (void)heiheihei2 {

}


@end
