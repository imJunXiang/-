//
//  ViewController.m
//  timerManger
//
//  Created by 俊祥 on 2018/8/28.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "ViewController.h"
#import "JXTimerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我是首页";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    JXTimerViewController *timerVC = [JXTimerViewController new];
    [self.navigationController pushViewController:timerVC animated:YES];
}

@end
