//
//  PropertyTestObject.h
//  Property_demo
//
//  Created by Ye Ye on 2019/3/5.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PropertyTestObject : NSObject {
    
    float _privateName;
    float _privateAttribute;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *names;
@property (nonatomic, assign) int count;
@property (nonatomic, weak) id delegate;
@property (atomic, strong) NSNumber *atomicProperty;

+ (void)test;

- (void)getInfo_objc_property;
- (void)getInfo_ivar;
- (void)getInfo_methods;
@end

NS_ASSUME_NONNULL_END
