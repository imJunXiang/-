//
//  ViewController.m
//  showAllSubClass
//
//  Created by 俊祥 on 2018/8/29.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self findSubClass:[UIPickerView class]];
    [self commonClass1:[NSArray class] andClass:[UILabel class]];
}

// 获取所有父类
- (NSArray *)superClasses:(Class)class {
    if (!class) {
        return @[];
    }
    
    NSMutableArray *result = @[].mutableCopy;
    while (class != nil) {
        [result addObject:class];
        class = [class superclass];
    }
    return [result copy];
}

- (Class)commonClass1:(Class)classA andClass:(Class)classB {
    NSArray *arr1 = [self superClasses:classA];
    NSArray *arr2 = [self superClasses:classB];
    
    // 时间复杂度 O(N^2)
//    for (NSInteger i = 0; i < arr1.count; ++i) {
//        Class targetClass = arr1[i];
//        // 只是看着简单 内部还是遍历了
//        if ([arr2 containsObject:targetClass]) {
//            NSLog(@"%@",targetClass);
//            return targetClass;
//        }
//    }
    
    // 时间复杂度 O(N)
    NSSet *set = [NSSet setWithArray:arr2];
    for (NSInteger i = 0; i < arr1.count; ++i) {
        Class targetClass = arr1[i];
        if ([set containsObject:targetClass]) {
            NSLog(@"%@",targetClass);
            return targetClass;
        }
    }
    
    // 时间复杂度 O(N^2)
//    for (NSInteger i = 0; i < arr1.count; ++i) {
//        Class targetClass = arr1[i];
//        for (NSInteger j = 0; j < arr2.count; ++j) {
//            if (targetClass == arr2[j]) {
//                NSLog(@"%@",targetClass);
//                return targetClass;
//            }
//        }
//    }
    return nil;
}

// printf all subclass 获取类的所有子类
- (NSArray *)findSubClass:(Class)defaultClass {
    // 获取所有注册类的数量
    int count = objc_getClassList(NULL, 0);
    
    if (count <= 0) {
        return @[];
    }
    
    NSMutableArray *output = @[defaultClass].mutableCopy;
    Class *classes = (Class *)malloc(sizeof(Class) * count);
    objc_getClassList(classes, count);
    for (int i = 0; i < count; i ++) {
        if (defaultClass == class_getSuperclass(classes[i])) {
            [output addObject:classes[i]];
        }
    }
    
    return output;
}


@end
