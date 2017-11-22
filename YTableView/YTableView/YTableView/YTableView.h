//
//  YTableView.h
//  YTableView
//
//  Created by Levante on 2017/11/22.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTableSection.h"

@protocol YTableViewSectionDataSource<NSObject>

/**
 客户分段数组
 
 @return 客户端分组
 */
- (NSArray *)customSections;

@end

@protocol YTableViewScrollDelegate<NSObject>

@optional

- (void)tableViewWillBeginDecelerating:(UITableView *)tableView;

- (void)tableViewWillBeginDragging:(UITableView *)tableView;

- (void)tableViewDidEndDecelerating:(UITableView *)tableView;

- (void)tableViewDidEndDragging:(UITableView *)tableView willDecelerate:(BOOL)decelerate;

- (void)tableViewDidEndScrollingAnimation:(UITableView *)tableView;

- (void)tableViewDidScroll:(UITableView *)tableView;

- (void)tableViewDidScrollToTop:(UITableView *)tableView;

@end

@interface YTableView : UITableView

@property(assign, nonatomic) BOOL enableCss;

@property (nonatomic, assign) BOOL isAppendTop;

/**
 数据源
 */
@property(weak, nonatomic) id<YTableViewSectionDataSource> sectionDataSource;

/**
 滚动委托
 */
@property(weak, nonatomic) id<YTableViewScrollDelegate> scrollDelegate;

/**
 获取分段索引
 
 @param section section 表格分段索引(直接取indexPath.section)
 @return 分段对象相对索引
 */
- (NSInteger)relsection:(NSInteger)section;


@end
