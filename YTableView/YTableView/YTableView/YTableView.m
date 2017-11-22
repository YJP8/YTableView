//
//  YTableView.m
//  YTableView
//
//  Created by Levante on 2017/11/22.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "YTableView.h"

@interface YTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YTableView


- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame style:UITableViewStylePlain];
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        [self setUpInitValue];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpInitValue];
    }
    return self;
}

- (void)setContentSize:(CGSize)contentSize {
    if(self.isAppendTop) {
        if (!CGSizeEqualToSize(self.contentSize, CGSizeZero)) {
            if (contentSize.height > self.contentSize.height) {
                CGPoint offset = self.contentOffset;
                offset.y += (contentSize.height - self.contentSize.height);
                self.contentOffset = offset;
            }
        }
    }
    
    [super setContentSize:contentSize];
}

- (void)setUpInitValue {
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSArray *)sections {
    if (nil != self.sectionDataSource) {
        return [self.sectionDataSource customSections];
    }
    return [NSMutableArray new];
}

- (id<YTableSection>)sectionBy:(NSInteger)section {
    NSInteger count = 0;
    for (id source in self.sections) {
        NSInteger subcount = [source numberOfSections];
        if (subcount != 0) {
            if (section >= count && section < count + subcount) {
                return source;
            }
        }
        
        count += subcount;
    }
    return nil;
}

- (NSInteger)relsection:(NSInteger)section {
    id<YTableSection> sec = [self sectionBy:section];
    NSInteger count = 0;
    
    for (id source in self.sections) {
        if (source == sec) {
            return section - count;
        }
        count += [source numberOfSections];
    }
    
    return section;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger count = 0;
    
    for (id source in self.sections) {
        count += [source numberOfSections];
    }
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<YTableSection> sec = [self sectionBy:section];
    NSInteger count = 0;
    count = [sec numberOfRows:@(section) relsection:@([self relsection:section])];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<YTableSection> sec = [self sectionBy:indexPath.section];
    UITableViewCell *cell = nil;
    
#ifndef DEBUG
    @try {
#endif
        cell = [sec cellForRowAtIndex:indexPath relsection:@([self relsection:indexPath.section])];
        
#ifndef DEBUG
    } @catch (NSException *exception) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"__FUCK_ERROR__"];
        cell.textLabel.text = @"cell获取失败!";
    }
#endif
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    id<YTableSection> sec = [self sectionBy:section];
    UIView *headView = nil;
    
    headView = [sec headerView:@(section) relsection:@([self relsection:section])];
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    id<YTableSection> sec = [self sectionBy:section];
    NSInteger relsection = [self relsection:section];
    UIView *footerView = nil;
    
    if ([sec numberOfRows:@(section) relsection:@(relsection)]) {
        footerView = [sec footerView:@(section) relsection:@(relsection)];
    }
    return footerView;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<YTableSection> sec = [self sectionBy:indexPath.section];
    NSInteger relsection = [self relsection:indexPath.section];
    CGFloat height = 0;
    
    height = [sec heightForCell:indexPath relsection:@(relsection)];
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    id<YTableSection> sec = [self sectionBy:section];
    NSInteger relsection = [self relsection:section];
    CGFloat height;
    
    height = [sec heightForHeader:@(section) relsection:@(relsection)];
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    id<YTableSection> sec = [self sectionBy:section];
    NSInteger relsection = [self relsection:section];
    CGFloat height = 0;
    
    
    if ([sec numberOfRows:@(section) relsection:@(relsection)]) {
        height = [sec heightForFooter:@(section) relsection:@(relsection)];
    }
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id<YTableSection> sec = [self sectionBy:indexPath.section];
    
    [sec cellSelected:indexPath relsection:@([self relsection:indexPath.section])];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    id<YTableSection> sec = [self sectionBy:indexPath.section];
    
    [sec cellDeselected:indexPath relsection:@([self relsection:indexPath.section])];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<YTableSection> sec = [self sectionBy:indexPath.section];
    UITableViewCellEditingStyle style = UITableViewCellEditingStyleNone;
    
    style = [sec editingStyle:indexPath relsection:@([self relsection:indexPath.section])];
    return style;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    id<YTableSection> sec = [self sectionBy:indexPath.section];
    
    [sec commitEditing:indexPath relsection:@([self relsection:indexPath.section])];
}

- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<YTableSection> sec = [self sectionBy:indexPath.section];
    NSString *titleStr = @"删除";
    titleStr = [sec
                titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath
                relsection:@([self relsection:indexPath.section])];
    return titleStr;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if ([self.scrollDelegate respondsToSelector:@selector(tableViewWillBeginDecelerating:)]) {
        [self.scrollDelegate tableViewWillBeginDecelerating:self];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if ([self.scrollDelegate respondsToSelector:@selector(tableViewWillBeginDragging:)]) {
        [self.scrollDelegate tableViewWillBeginDragging:self];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([self.scrollDelegate respondsToSelector:@selector(tableViewDidEndDecelerating:)]) {
        [self.scrollDelegate tableViewDidEndDecelerating:self];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(scrollViewDidEndScrollingAnimation:)
                                               object:self];
    
    if ([self.scrollDelegate respondsToSelector:@selector(tableViewDidEndScrollingAnimation:)]) {
        [self.scrollDelegate tableViewDidEndScrollingAnimation:self];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([self.scrollDelegate respondsToSelector:@selector(tableViewDidEndDragging:willDecelerate:)]) {
        [self.scrollDelegate tableViewDidEndDragging:self willDecelerate:decelerate];
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (self.scrollDelegate&&
        [self.scrollDelegate respondsToSelector:@selector(tableViewDidScrollToTop:)]) {
        [self.scrollDelegate tableViewDidScrollToTop:self];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(scrollViewDidEndScrollingAnimation:)
                                               object:self];
    
    [self performSelector:@selector(scrollViewDidEndScrollingAnimation:)
               withObject:self
               afterDelay:0.3];
    
    if ([self.scrollDelegate respondsToSelector:@selector(tableViewDidScroll:)]) {
        [self.scrollDelegate tableViewDidScroll:self];
    }
}

@end
