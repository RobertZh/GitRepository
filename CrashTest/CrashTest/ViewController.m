//
//  ViewController.m
//  CrashTest
//
//  Created by zhangwei on 2019/2/28.
//  Copyright © 2019 zhangwei. All rights reserved.
//

#import "ViewController.h"
#import <Aspects.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSArray aspect_hookSelector:@selector(objectAtIndex:) withOptions:AspectPositionBefore usingBlock:^ {
        NSLog(@"aspect_hookSelector:@selector(objectAtIndex:)");
    } error:nil];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSArray *array = @[];
    
//    id object = [array objectAtIndexedSubscript:1];
    id object = [array objectAtIndex:1];
    NSLog(@"object is %@", object);
}


@end
