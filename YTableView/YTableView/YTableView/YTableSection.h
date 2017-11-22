//
//  YTableSection.h
//  YTableView
//
//  Created by Levante on 2017/11/22.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YTableSection<NSObject>

/**
 子分段个数
 
 @return 子分段个数
 */
- (NSInteger)numberOfSections;

/**
 某个子分段的元素个数
 
 @param section 表格分段索引
 @param relsection 相对section索引
 @return 子分段的元素个数
 */
- (NSInteger)numberOfRows:(NSNumber *)section relsection:(NSNumber *)relsection;

/**
 cell高度
 
 @param indexPath indexPath
 @param relsection 相对section索引
 @return cell高度
 */
- (CGFloat)heightForCell:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection;

/**
 元素高度自动缩放，需要适配大屏，有些元素高度要成倍调整的，返回true
 
 @param indexPath indexPath
 @param relsection 相对section索引
 @return true 自动缩放 flase不缩放
 */
- (BOOL)cellAutoScale:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection;

/**
 获取cell
 
 @param indexPath indexPath
 @param relsection 相对section索引
 @return cell
 */
- (UITableViewCell *)cellForRowAtIndex:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection;

/**
 section header高度
 
 @param section section位置
 @param relsection 相对section索引
 @return header高度
 */
- (CGFloat)heightForHeader:(NSNumber *)section relsection:(NSNumber *)relsection;

/**
 section header高度自动缩放，需要适配大屏，有些元素高度要成倍调整的，返回true
 
 @param section section位置
 @param relsection 相对section索引
 @return true 自动缩放 flase不缩放
 */
- (BOOL)headerAutoScale:(NSNumber *)section relsection:(NSNumber *)relsection;

/**
 section头部视图
 
 @param section section位置
 @param relsection 相对section索引
 @return section头部视图
 */
- (UIView *)headerView:(NSNumber *)section relsection:(NSNumber *)relsection;

/**
 section footer视图高度
 
 @param section section位置
 @param relsection 相对section索引
 @return footer视图高度
 */
- (CGFloat)heightForFooter:(NSNumber *)section relsection:(NSNumber *)relsection;

/**
 section footer高度自动缩放，需要适配大屏，有些元素高度要成倍调整的，返回true
 
 @param section section位置
 @param relsection 相对section索引
 @return true 自动缩放 flase不缩放
 */
- (BOOL)footerAutoScale:(NSNumber *)section relsection:(NSNumber *)relsection;

/**
 section footer视图
 
 @param section section位置
 @param relsection 相对section索引
 @return footer视图
 */
- (UIView *)footerView:(NSNumber *)section relsection:(NSNumber *)relsection;

/**
 cell 选择
 
 @param indexPath indexPath
 @param relsection 相对section索引
 */
- (void)cellSelected:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection;

/**
 cell取消选择
 
 @param indexPath indexPath
 @param relsection 相对section索引
 */
- (void)cellDeselected:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection;

/**
 cell编辑样式
 
 @param indexPath indexPath
 @param relsection 相对section索引
 @return cell编辑样式
 */
- (UITableViewCellEditingStyle)editingStyle:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection;

/**
 提交编辑
 
 @param indexPath indexPath
 @param relsection 相对section索引
 */
- (void)commitEditing:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection;

/**
 设置tableviewCell左划删除按钮文字
 
 @param indexPath indexPath
 @param relsection 相对section索引
 @return 删除按钮文字
 */
- (NSString *)titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection;

@end

@interface YTableSection : NSObject <YTableSection>

/**
 对象
 */
@property(weak, nonatomic) id target;

/**
 section数
 (NSNumber*) section
 return类型要求是 NSNumber, 如果不指定该Selector，默认返回1个
 */
@property(assign, nonatomic) SEL numberOfSectionSelector;

/**
 section cell个数
 (NSNumber*) section
 return类型要求是 NSNumber, 如果不指定该Selector, 默认返回1个
 */
@property(assign, nonatomic) SEL numberOfRowsSelector;

/**
 cell高度
 (NSIndexPath*) indexPath
 return类型要求是 NSNumber 类型
 */
@property(assign, nonatomic) SEL heightForCellSelector;

/**
 cell高度比例
 (NSIndexPath*) indexPath
 return类型要求是 NSNumber YES,NO类型
 */
@property(assign, nonatomic) SEL cellAutoScaleSelector;

/**
 cell
 (NSIndexPath*) indexPath
 return类型要求是 UITableViewCell
 */
@property(assign, nonatomic) SEL cellForRowAtIndexSelector;

/**
 section header 高度
 (NSNumber*) section
 return类型要求是 NSNumber 类型
 */
@property(assign, nonatomic) SEL heightForHeaderSelector;

/**
 section header高度比例
 (NSNumber*) section
 return类型要求是 NSNumber YES,NO类型
 */
@property(assign, nonatomic) SEL headerAutoScaleSelector;

/**
 section header view
 (NSNumber*) section
 return类型要求是 UIView 类型
 */
@property(assign, nonatomic) SEL headerViewSelector;

/**
 section footer view
 (NSNumber*) section
 return类型要求是 NSNumber 类型
 */
@property(assign, nonatomic) SEL heightForFooterSelector;

/**
 section footer 缩放
 (NSNumber*) section
 return类型要求是 NSNumber YES,NO类型
 */
@property(assign, nonatomic) SEL footerAutoScaleSelector;

/**
 section footer view
 (NSNumber*) section
 return类型要求是 UIView 类型
 */
@property(assign, nonatomic) SEL footerViewSelector;

/**
 cell 选中
 (NSIndexPath*) indexPath
 */
@property(assign, nonatomic) SEL cellSelectedSelector;

/**
 cell 取消选中
 (NSIndexPath*) indexPath
 */
@property(assign, nonatomic) SEL cellDeselectedSelector;

/**
 编辑样式
 (NSIndexPath*) indexPath
 return 类型要求是 NSNumber 类型
 */
@property(assign, nonatomic) SEL editingStyleSelector;

/**
 提交编辑
 (NSIndexPath*) indexPat
 */
@property(assign, nonatomic) SEL commitEditingSelector;

/**
 设置tableviewCell左划删除按钮文字  (NSIndexPath*) indexPath
 return NSString
 */
@property(assign, nonatomic) SEL titleForDeleteConfirmationButtonSelector;

/**
 绑定一个目标对象
 
 @param target target
 @return 对象
 */
- (id)initWithTarget:(id)target;

/**
 创建并绑定一个对象
 
 @param target 对象
 @return 对象
 */
+ (id)createWithTarget:(id)target;


@end
