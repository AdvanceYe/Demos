//
//  ViewController.m
//  view_autoResizingMask
//
//  Created by Ye Ye on 2019/3/8.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIView *_v1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _v1 = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
    _v1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 90, 90)];
    v2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    v2.backgroundColor = [UIColor greenColor];
    [_v1 addSubview:v2];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGRect frame = _v1.frame;
    frame.size.width += 20;
    frame.size.height += 20;
    _v1.frame = frame;
}

@end
