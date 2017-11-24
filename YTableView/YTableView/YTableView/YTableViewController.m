//
//  YTableViewController.m
//  YTableView
//
//  Created by Levante on 2017/11/22.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "YTableViewController.h"

#define kYTableViewSeperatorCell @"YTableViewSeperatorCell"


@interface YTableViewController () <YTableViewSectionDataSource>

@end

@implementation YTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self registerTableViewCell];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kYTableViewSeperatorCell];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark 业务方法

-(NSArray *)customSections {
    return [NSArray array];
}

#pragma mark - 分隔块

- (NSNumber*)splitSectionHeightOfCellWithIndexPath:(NSIndexPath*)indexPath {
    return @10;
}

- (UITableViewCell*)splitSectionCellForRowWithIndexPath:(NSIndexPath*)indexPath {
    return [self cellForSeperator];
}

- (NSNumber*)splitSectionNumberOfRowWithSection:(NSNumber*)section {
    return @1;
}

- (UITableViewCell*)cellForSeperator {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kYTableViewSeperatorCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor colorWithRed:247/255.0 green:249/255.0 blue:251/255.0 alpha:1.0];
    return cell;
}

#pragma mark 控件

- (void)registerTableViewCell {
    
}

- (YTableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[YTableView alloc]init];
        _tableView.sectionDataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}

- (YTableSection *)splitSection{
    if (_splitSection == nil) {
        _splitSection = [YTableSection createWithTarget:self];
        _splitSection.heightForCellSelector =
        @selector(splitSectionHeightOfCellWithIndexPath:);
        _splitSection.numberOfRowsSelector =
        @selector(splitSectionNumberOfRowWithSection:);
        _splitSection.cellForRowAtIndexSelector = @selector(splitSectionCellForRowWithIndexPath:);
    }
    return _splitSection;
}


@end
