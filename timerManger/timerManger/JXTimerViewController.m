//
//  JXTimerViewController.m
//  timerManger
//
//  Created by 俊祥 on 2018/8/28.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "JXTimerViewController.h"
#import "JXTimerManger.h"

@interface JXTimerViewController ()
@property (nonatomic ,strong) NSTimer *myTimer;
@end

@implementation JXTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我是测试VC";
    self.view.backgroundColor = [UIColor yellowColor];
    
    
//    NSRunLoop *runLoop = [NSRunLoop mainRunLoop];
//    [runLoop addTimer:self.myTimer forMode:NSRunLoopCommonModes];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    typeof(self) __weak weakSelf = self;
//    self.myTimer = [NSTimer timerWithTimeInterval:1 target:[JXTimerManger shareMangerWithTarget:self] selector:@selector(timerRun) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.myTimer forMode:NSRunLoopCommonModes];
//
//    [self.myTimer fire];
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:[JXTimerManger shareMangerWithTarget:self] selector:@selector(timerRun) userInfo:nil repeats:YES];
    
//    typeof(self) __weak weakSelf = self;
//    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        typeof(self) __strong strongSelf = weakSelf;
//        [strongSelf timerRun];
//    }];
    
    
    
//    typeof(self) __weak weakSelf = self;
//    self.myTimer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        typeof(self) __strong strongSelf = weakSelf;
//        [strongSelf timerRun];
//    }];
//
//    if (!self.myTimer) {
//        NSLog(@"不存在");
//        return;
//    }
//    [[NSRunLoop mainRunLoop] addTimer:self.myTimer forMode:NSRunLoopCommonModes];
//
//    [self.myTimer fire];
}

- (void)timerRun {
    NSLog(@"timer run");
}

- (void)dealloc {
    // 停止timer
    [self.myTimer invalidate];
    self.myTimer = nil;
    NSLog(@"delloc");
}
@end
