//
//  ArrayException.m
//  CrashTest
//
//  Created by zhangwei on 2019/2/28.
//  Copyright © 2019 zhangwei. All rights reserved.
//

#import "ArrayException.h"
#import <objc/message.h>


@implementation ArrayException


+ (void)load {
    
}


void exchange_object_at_index() {
    Method m1 = class_getInstanceMethod(NSArray.class, @selector(objectAtIndex:));
    Method m2 = class_getInstanceMethod(ArrayException.class, @selector(__objectAtIndex:));
    method_exchangeImplementations(m1, m2);
}


- (void)__objectAtIndex:(NSInteger)index {
    
}

@end
