//
//  PropertyTestObject.m
//  Property_demo
//
//  Created by Ye Ye on 2019/3/5.
//  Copyright © 2019 copyCat_yy. All rights reserved.
//

#import "PropertyTestObject.h"
#import <objc/runtime.h>

@implementation PropertyTestObject

- (void)getInfo_objc_property {
    
    /*
     2019-03-05 10:16:43.243570+0800 Property_demo[1982:39211] >>> outCount = 5
     2019-03-05 10:16:43.243694+0800 Property_demo[1982:39211] --------
     2019-03-05 10:16:43.243768+0800 Property_demo[1982:39211] title    T@"NSString",C,N,V_title
     2019-03-05 10:16:43.243830+0800 Property_demo[1982:39211] >>> count = 4
     2019-03-05 10:16:43.243885+0800 Property_demo[1982:39211] name: T    value: @"NSString"
     2019-03-05 10:16:43.243945+0800 Property_demo[1982:39211] name: C    value:
     2019-03-05 10:16:43.244008+0800 Property_demo[1982:39211] name: N    value:
     2019-03-05 10:16:43.244068+0800 Property_demo[1982:39211] name: V    value: _title
     2019-03-05 10:16:43.244137+0800 Property_demo[1982:39211] --------
     2019-03-05 10:16:43.244195+0800 Property_demo[1982:39211] names    T@"NSArray",&,N,V_names
     2019-03-05 10:16:43.244335+0800 Property_demo[1982:39211] >>> count = 4
     2019-03-05 10:16:43.244557+0800 Property_demo[1982:39211] name: T    value: @"NSArray"
     2019-03-05 10:16:43.244772+0800 Property_demo[1982:39211] name: &    value:
     2019-03-05 10:16:43.244985+0800 Property_demo[1982:39211] name: N    value:
     2019-03-05 10:16:43.245205+0800 Property_demo[1982:39211] name: V    value: _names
     2019-03-05 10:16:43.262914+0800 Property_demo[1982:39211] --------
     2019-03-05 10:16:43.263033+0800 Property_demo[1982:39211] count    Ti,N,V_count
     2019-03-05 10:16:43.263120+0800 Property_demo[1982:39211] >>> count = 3
     2019-03-05 10:16:43.263190+0800 Property_demo[1982:39211] name: T    value: i
     2019-03-05 10:16:43.263258+0800 Property_demo[1982:39211] name: N    value:
     2019-03-05 10:16:43.263331+0800 Property_demo[1982:39211] name: V    value: _count
     2019-03-05 10:16:43.263401+0800 Property_demo[1982:39211] --------
     2019-03-05 10:16:43.263469+0800 Property_demo[1982:39211] delegate    T@,W,N,V_delegate
     2019-03-05 10:16:43.263533+0800 Property_demo[1982:39211] >>> count = 4
     2019-03-05 10:16:43.263601+0800 Property_demo[1982:39211] name: T    value: @
     2019-03-05 10:16:43.263667+0800 Property_demo[1982:39211] name: W    value:
     2019-03-05 10:16:43.263839+0800 Property_demo[1982:39211] name: N    value:
     2019-03-05 10:16:43.264001+0800 Property_demo[1982:39211] name: V    value: _delegate
     2019-03-05 10:16:43.264160+0800 Property_demo[1982:39211] --------
     2019-03-05 10:16:43.265209+0800 Property_demo[1982:39211] atomicProperty    T@"NSNumber",&,V_atomicProperty
     2019-03-05 10:16:43.265285+0800 Property_demo[1982:39211] >>> count = 3
     2019-03-05 10:16:43.265353+0800 Property_demo[1982:39211] name: T    value: @"NSNumber"
     2019-03-05 10:16:43.265415+0800 Property_demo[1982:39211] name: &    value:
     2019-03-05 10:16:43.265478+0800 Property_demo[1982:39211] name: V    value: _atomicProperty
     */
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
    NSLog(@">>> outCount = %d", outCount);
    for (unsigned int i = 0; i < outCount; ++i) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        
        NSLog(@"--------");
        const char *propertyAttributes = property_getAttributes(property);
        NSLog(@"%s\t%s", propertyName, propertyAttributes);
        
        unsigned int count = 0;
        objc_property_attribute_t *attrbutes = property_copyAttributeList(property, &count);
        NSLog(@">>> count = %d", count);
        for (unsigned int j = 0; j < count; ++j) {
            objc_property_attribute_t attribute = attrbutes[j];
            
            const char *name = attribute.name;
            const char *value = attribute.value;
            NSLog(@"name: %s\tvalue: %s", name, value);
        }
        
        free(attrbutes);
    }
    
    free(properties);
}

- (void)getInfo_ivar {
    /*
     2019-03-05 10:16:43.265635+0800 Property_demo[1982:39211] name: _privateName    encodeType: f
     2019-03-05 10:16:43.265861+0800 Property_demo[1982:39211] name: _privateAttribute    encodeType: f
     2019-03-05 10:16:43.266077+0800 Property_demo[1982:39211] name: _count    encodeType: i
     2019-03-05 10:16:43.266281+0800 Property_demo[1982:39211] name: _title    encodeType: @"NSString"
     2019-03-05 10:16:43.266489+0800 Property_demo[1982:39211] name: _names    encodeType: @"NSArray"
     2019-03-05 10:16:43.266700+0800 Property_demo[1982:39211] name: _delegate    encodeType: @
     2019-03-05 10:16:43.266909+0800 Property_demo[1982:39211] name: _atomicProperty    encodeType: @"NSNumber"
     */
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList(self.class, &outCount);
    
    for (unsigned int i = 0; i < outCount; ++i) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        
        NSLog(@"name: %s\tencodeType: %s", name, type);
    }
    free(ivars);
}

- (void)getInfo_methods {
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(self.class, &methodCount);
    for (unsigned int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        SEL sel = method_getName(method);
        IMP imp = method_getImplementation(method);
        const char *name = sel_getName(sel);
        NSString *mName;
        NSString *mTypeEncoding;
        NSString *mreturnTypeEncoding;
        NSMutableArray * mArgumentTypeEncodings;
        if (name) {
            mName = [NSString stringWithUTF8String:name];
        }
        const char *typeEncoding = method_getTypeEncoding(method);
        if (typeEncoding) {
            mTypeEncoding = [NSString stringWithUTF8String:typeEncoding];
        }
        char *returnType = method_copyReturnType(method);
        if (returnType) {
            mreturnTypeEncoding = [NSString stringWithUTF8String:returnType];
            free(returnType);
        }
        unsigned int argumentCount = method_getNumberOfArguments(method);
        if (argumentCount > 0) {
            NSMutableArray *argumentTypes = [NSMutableArray new];
            for (unsigned int i = 0; i < argumentCount; i++) {
                char *argumentType = method_copyArgumentType(method, i);
                NSString *type = argumentType ? [NSString stringWithUTF8String:argumentType] : nil;
                [argumentTypes addObject:type ? type : @""];
                if (argumentType) free(argumentType);
            }
            mArgumentTypeEncodings = argumentTypes;
        }
        NSLog(@"name = %@,\ntypeEncoding = %@,\nreturnTypeEncoding = %@,\nargumentTypeEncodings = %@", mName, mTypeEncoding, mreturnTypeEncoding, mArgumentTypeEncodings);
    }
    free(methods);
}

+ (void)test {
    
}

@end
