//
//  TestObj1.h
//  AOP_demo
//
//  Created by yeye(* ￣＾￣) on 2019/1/1.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TestObj2;
@interface TestObj1 : NSObject

@property (nonatomic) TestObj2 *obj2;

- (void)doSth;

@end

NS_ASSUME_NONNULL_END
