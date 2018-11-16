//
//  JXTableViewCell.m
//  testMoreTables
//
//  Created by 俊祥 on 2018/9/3.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "JXTableViewCell.h"

@interface JXTableViewCell ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView   *mainTable;
@property (nonatomic ,strong) NSSet<UITouch *> *touches;
@property (nonatomic ,strong) UIEvent       *event;
@end

@implementation JXTableViewCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self findView];
    }
    return self;
}

- (void)findView {
    
    self.mainTable = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
    
//    UIGestureRecognizer
    
    [self.contentView addSubview:self.mainTable];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if (self.mainTable.contentOffset.y == 0) {
//        return nil;
//    }
    return [super hitTest:point withEvent:event];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取一个UITouch
    UITouch *touch = [touches anyObject];
    // 获取当前的位置
    CGPoint current = [touch locationInView:self];
    CGFloat y = 280;
    if (current.y >= y+ 10) {
        //在地图上
        NSLog(@"滚动地图");
    } else {
        return [super touchesBegan:touches withEvent:event];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%@",@([scrollView.panGestureRecognizer translationInView:scrollView.panGestureRecognizer.view]));
    
    [self.superTable.panGestureRecognizer setTranslation:[scrollView.panGestureRecognizer translationInView:scrollView.panGestureRecognizer.view] inView:self.mainTable];
}


@end
