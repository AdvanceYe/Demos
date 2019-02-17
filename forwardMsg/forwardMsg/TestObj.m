//
//  TestObj.m
//  forwardMsg
//
//  Created by yeye(* ￣＾￣) on 2019/2/16.
//  Copyright © 2019年 com.test. All rights reserved.
//

#import "TestObj.h"
#import <objc/runtime.h>
#import "Person.h"

/*
 
 http://solacode.github.io/2015/10/21/objc-msgSend-%E5%87%BD%E6%95%B0%E5%92%8C-objc-msgForward()%E5%87%BD%E6%95%B0%E4%BD%9C%E7%94%A8/
 */

void impWhat(id self, SEL cmd) {
    printf("mmp....");
}

@implementation TestObj

+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@">>> 类方法");
    return YES;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@">>> 对象方法");
    
    /*
     CoreFoundation`-[NSObject(NSObject) methodSignatureForSelector:]:
     CoreFoundation`__methodDescriptionForSelector:
     libobjc.A.dylib`class_getInstanceMethod:
     libobjc.A.dylib`lookUpImpOrForward:
     + (BOOL)resolveInstanceMethod:(SEL)sel
     */
    
    if ([NSStringFromSelector(sel) isEqualToString:@"what"]) {
        /*
        ”v@:”意思就是这已是一个void类型的方法，没有参数传入。
        “i@:”就是说这是一个int类型的方法，没有参数传入。
        ”i@:@”就是说这是一个int类型的方法，有一个对象参数传入。
         */
        class_addMethod(self, sel, (IMP)impWhat, "v@:");
        return YES;
    }
    //what2返回NO,执行forwardingTargetForSelector
    return [super resolveInstanceMethod:sel];
}


- (id)forwardingTargetForSelector:(SEL)aSelector {
    //给备用对象去执行
    if ([NSStringFromSelector(aSelector) isEqualToString:@"what2"]) {
        //返回Person对象，让Person对象接收这个消息
        return [Person new];
    }
    id result = [super forwardingTargetForSelector:aSelector];
    return result;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"what3"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"aninvocation = %@", anInvocation);
    //不执行也不会崩，但就是不执行。
    
    SEL sel = [anInvocation selector];
    //创建接受对象
    Person *proxy = [Person new];
    //判断是否实现了这个方法
    if ([proxy respondsToSelector:sel]) {
        // 唤醒这个方法
        [anInvocation invokeWithTarget:proxy];
    }else{
        [super forwardInvocation:anInvocation];
    }
}

@end
