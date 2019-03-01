//
//  NSArray+OutOfRange.m
//  CrashTest
//
//  Created by zhangwei on 2019/2/28.
//  Copyright © 2019 zhangwei. All rights reserved.
//

#import "NSArray+OutOfRange.h"
#import <objc/runtime.h>

@implementation NSArray (OutOfRange)

/** 1表示 debug 和 release 都发生交换
 *  0表示只有在 release 发生交换
 */
#define EXCHANGE_ARRAY_METHOD_ALWAYS 0

+ (void)load {

#if DEBUG
    #if EXCHANGE_ARRAY_METHOD_ALWAYS
    exchange_get_element();
    #endif
#else
    exchange_get_element();
#endif
}


void exchange_get_element()
{
    char *classNames[] = {  "__NSArrayI",
                            "__NSArrayI",
                            "__NSArrayM",
                            "__NSArrayM"
                            };
    
    char *sysSelectors[] = {"objectAtIndex:",
                            "objectAtIndexedSubscript:",
                            "objectAtIndex:",
                            "objectAtIndexedSubscript:"
                            };
    
    char *usrSelectors[] = {"_objectAtIndex:",
                            "_objectAtIndexedSubscript:",
                            "__objectAtIndex:",
                            "__objectAtIndexedSubscript:"
                            };
    
    int size = sizeof(sysSelectors) / sizeof(*sysSelectors);
    for (int i = 0; i < size; i++) {
        Method sysMethod = class_getInstanceMethod(objc_getClass(classNames[i]), NSSelectorFromString([NSString stringWithUTF8String:sysSelectors[i]]));
        Method userMethod = class_getInstanceMethod(objc_getClass(classNames[i]), NSSelectorFromString([NSString stringWithUTF8String:usrSelectors[i]]));
        method_exchangeImplementations(sysMethod, userMethod);
    }
}

- (id)_objectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        return nil;
    }
    if (index >= self.count) {
        index = self.count - 1;
    }
    return [self _objectAtIndex:index];
}



- (id)__objectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        return nil;
    }
    if (index >= self.count) {
        index = self.count - 1;
    }
    return [self __objectAtIndex:index];
}

- (id)_objectAtIndexedSubscript:(NSUInteger)idx {
    if (self.count == 0) {
        return nil;
    }
    if (idx >= self.count) {
        idx = self.count - 1;
    }
    return [self _objectAtIndexedSubscript:idx];
}

- (id)__objectAtIndexedSubscript:(NSUInteger)idx {
    if (self.count == 0) {
        return nil;
    }
    if (idx >= self.count) {
        idx = self.count - 1;
    }
    return [self __objectAtIndexedSubscript:idx];
}

@end
