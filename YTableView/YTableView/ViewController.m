//
//  ViewController.m
//  YTableView
//
//  Created by Levante on 2017/11/22.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "ViewController.h"
#import "YTableViewCell.h"

#define kTableViewCell @"TableViewCell"
#define kYTableViewCell @"YTableViewCell"

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
    UINib *nib = [UINib nibWithNibName:kYTableViewCell bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:kYTableViewCell];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCell];
}

#pragma mark TableViewCell

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

#pragma mark Split

- (UITableViewCell *)cellForSplit:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self cellForSeperator];
    cell.contentView.backgroundColor = [UIColor cyanColor];
    return cell;
}

- (NSNumber *)heightCellForSplit:(NSIndexPath *)indexPath {
    return @10;
}

#pragma mark YTableViewCell

- (UITableViewCell *)cellForYCell:(NSIndexPath *)indexPath {
    YTableViewCell *cell = [self.tableView  dequeueReusableCellWithIdentifier:kYTableViewCell forIndexPath:indexPath];
    return cell;
}

- (NSNumber *)numberOfRowsForYCell:(NSIndexPath *)indexPath {
    return @(3);
}

-  (NSNumber *)heightForYCell:(NSIndexPath *)indexPath {
    return  @50;
}

- (NSMutableArray *)customSections {
    if (_sections == nil) {
        _sections = [NSMutableArray array];
        
        YTableSection *sec = [YTableSection createWithTarget:self];
        sec.cellForRowAtIndexSelector = @selector(cellForCell:);
        sec.heightForCellSelector = @selector(heightForCell:);
        sec.numberOfRowsSelector = @selector(numberOfRowsForCell:);
        [_sections addObject:sec];
        
        sec = [YTableSection createWithTarget:self];
        sec.cellForRowAtIndexSelector = @selector(cellForSplit:);
        sec.heightForCellSelector = @selector(heightCellForSplit:);
        [_sections addObject:sec];
        
        sec = [YTableSection createWithTarget:self];
        sec.cellForRowAtIndexSelector  = @selector(cellForYCell:);
        sec.heightForCellSelector = @selector(heightForYCell:);
        sec.numberOfRowsSelector = @selector(numberOfRowsForYCell:);
        [_sections addObject:sec];
    }
    return _sections;
}
@end
