//
//  ViewController.m
//  OutSuperView
//
//  Created by 俊祥 on 2018/8/30.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "ViewController.h"
#import "JXView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JXView *view = [[JXView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.center = self.view.center;
    view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    btn.hidden = YES;
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(-100, -100, 200, 200)];
//        btn.hidden = YES;
    btn2.backgroundColor = [UIColor yellowColor];
    [btn2 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn2];
    
    [self.view addSubview:view];
}

- (void)clickBtn:(UIButton *)btn {
    NSLog(@"哈哈哈哈");
}

@end
