//
//  ViewController.m
//  YTableView
//
//  Created by Levante on 2017/11/22.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "ViewController.h"

#define kTableViewCell @"tableViewCell"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *_sections;
    NSArray *_dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = @[@"星期一", @"星期二", @"星期三", @"星期四", @"星期五"];
}


- (void)registerTableViewCell {
//    UINib *nib = [UINib nibWithNibName:kTableViewCell bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:kTableViewCell];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCell];
}

#pragma mark FundDetailBody

- (UITableViewCell *)cellForCell:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kTableViewCell forIndexPath:indexPath];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (NSNumber *)heightForCell:(NSIndexPath *)indexPath {
    return @45;
}

- (NSNumber *)numberOfRowsForCell:(NSIndexPath *)indexPath {
    return @(_dataArray.count);
}

- (NSMutableArray *)customSections {
    if (_sections == nil) {
        _sections = [NSMutableArray array];
        
        YTableSection *sec = [YTableSection createWithTarget:self];
        sec.cellForRowAtIndexSelector = @selector(cellForCell:);
        sec.heightForCellSelector = @selector(heightForCell:);
        sec.numberOfRowsSelector = @selector(numberOfRowsForCell:);
        [_sections addObject:sec];
    }
    return _sections;
}
@end
