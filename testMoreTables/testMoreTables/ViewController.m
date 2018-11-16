//
//  ViewController.m
//  testMoreTables
//
//  Created by 俊祥 on 2018/9/3.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "ViewController.h"
#import "JXTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView   *mainTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mainTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    self.mainTable.backgroundColor = [UIColor yellowColor];
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
    
    [self.view addSubview:self.mainTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        JXTableViewCell *cell = [JXTableViewCell new];
        cell.superTable = self.mainTable;
        return cell;
    }
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        return self.view.frame.size.height;
    } else {
        return 44;
    }
}


@end
