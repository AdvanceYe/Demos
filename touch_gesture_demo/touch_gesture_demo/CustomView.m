//
//  CustomView.m
//  touch_gesture_demo
//
//  Created by Ye Ye on 2019/3/4.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self addTapGesture];
//        [self addPanGesture];
        /*
         感觉touchbegan比手势快
         */
        
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)addTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action)];
    [self addGestureRecognizer:tap];
}

- (void)addPanGesture {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(action)];
    [self addGestureRecognizer:pan];
}

- (void)action {
    NSLog(@"___ action");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"___ touch began");
}

@end
