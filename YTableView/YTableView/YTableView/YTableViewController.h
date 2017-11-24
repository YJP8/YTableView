//
//  YTableViewController.h
//  YTableView
//
//  Created by Levante on 2017/11/22.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTableView.h"

@interface YTableViewController : UIViewController

@property (nonatomic, strong) YTableView *tableView;
@property (nonatomic, strong) YTableSection *splitSection;

/**
 客户端分组
 
 @return 分组
 */
- (NSArray *)customSections;

/**
 分割
 
 @return cell
 */
- (UITableViewCell*)cellForSeperator;

/**
 注册TableViewCell
 */
- (void)registerTableViewCell;

@end
