//
//  ViewController.m
//  CrashTest
//
//  Created by zhangwei on 2019/2/28.
//  Copyright © 2019 zhangwei. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+OutOfRange.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)clickArray:(id)sender {
    NSArray *array = @[@"0", @"1", @"2", @"3", @"4", @"5"];
    id obj = [array objectAtIndex:10];
    NSLog(@"objectAtIndex:10 is %@", obj);
    id object = array[10];
    NSLog(@"array[10] is %@", object);
    NSLog(@"==============================================");
}


- (IBAction)clickMutableArray:(id)sender {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        [array addObject:@(i)];
    }
    [array removeAllObjects];
    id obj = [array objectAtIndex:10];
    NSLog(@"OBJECT AT INDEX:10 IS %@", obj);
    id object = array[array.count + 10];
    NSLog(@"ARRAY[COUNT + 10] IS %@", object);
    NSLog(@"==============================================");
}





@end
