//
//  YTableSection.m
//  YTableView
//
//  Created by Levante on 2017/11/22.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "YTableSection.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@implementation YTableSection

- (id)initWithTarget:(id)target {
    self = [super init];
    
    if (self) {
        self.target = target;
    }
    return self;
}

+ (id)createWithTarget:(id)target {
    return [[YTableSection alloc] initWithTarget:target];
}

- (NSInteger)numberOfSections {
    if (self.target && self.numberOfSectionSelector) {
        id result = [self.target performSelector:self.numberOfSectionSelector withObject:nil];
        
        return [result intValue];
    }
    return 1;
}

- (NSInteger)numberOfRows:(NSNumber *)section relsection:(NSNumber *)relsection {
    NSInteger ret = 1;
    
    if (self.target && self.numberOfRowsSelector) {
        id result = [self.target performSelector:self.numberOfRowsSelector
                                      withObject:section
                                      withObject:relsection];
        
        ret = [result intValue];
    }
    
    return ret;
}

- (UITableViewCell *)cellForRowAtIndex:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection {
    UITableViewCell *ret = nil;
    
    if (self.target && self.cellForRowAtIndexSelector) {
        id result = [self.target performSelector:self.cellForRowAtIndexSelector
                                      withObject:indexPath
                                      withObject:relsection];
        
        ret = result;
    }
    return ret;
}

- (CGFloat)heightForCell:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection {
    CGFloat ret = 0;
    
    if (self.target && self.heightForCellSelector) {
        id result = [self.target performSelector:self.heightForCellSelector
                                      withObject:indexPath
                                      withObject:relsection];
        
        return [result floatValue];
    }
    
    return ret;
}

- (BOOL)cellAutoScale:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection {
    CGFloat ret = 0;
    
    if (self.target && self.cellAutoScaleSelector) {
        id result = [self.target performSelector:self.cellAutoScaleSelector
                                      withObject:indexPath
                                      withObject:relsection];
        
        return [result floatValue];
    }
    
    return ret;
}

- (UIView *)headerView:(NSNumber *)section relsection:(NSNumber *)relsection {
    UIView *ret = nil;
    
    if (self.target && self.headerViewSelector) {
        id result = [self.target performSelector:self.headerViewSelector
                                      withObject:section
                                      withObject:relsection];
        
        ret = result;
    }
    
    return ret;
}

- (CGFloat)heightForHeader:(NSNumber *)section relsection:(NSNumber *)relsection {
    CGFloat ret = 0;
    
    if (self.target && self.heightForHeaderSelector) {
        id result = [self.target performSelector:self.heightForHeaderSelector
                                      withObject:section
                                      withObject:relsection];
        
        ret = [result floatValue];
    }
    
    return ret;
}

- (BOOL)headerAutoScale:(NSNumber *)section relsection:(NSNumber *)relsection {
    CGFloat ret = 0;
    
    if (self.target && self.headerAutoScaleSelector) {
        id result = [self.target performSelector:self.headerAutoScaleSelector
                                      withObject:section
                                      withObject:relsection];
        
        return [result boolValue];
    }
    
    return ret;
}

- (UIView *)footerView:(NSNumber *)section relsection:(NSNumber *)relsection {
    UIView *ret = nil;
    
    if (self.target && self.footerViewSelector) {
        id result = [self.target performSelector:self.footerViewSelector
                                      withObject:section
                                      withObject:relsection];
        
        ret = result;
    }
    
    return ret;
}

- (BOOL)footerAutoScale:(NSNumber *)section relsection:(NSNumber *)relsection {
    CGFloat ret = 0;
    
    if (self.target && self.footerAutoScaleSelector) {
        id result = [self.target performSelector:self.footerAutoScaleSelector
                                      withObject:section
                                      withObject:relsection];
        
        return [result boolValue];
    }
    
    return ret;
}

- (CGFloat)heightForFooter:(NSNumber *)section relsection:(NSNumber *)relsection {
    CGFloat ret = 0;
    
    if (self.target && self.heightForFooterSelector) {
        id result = [self.target performSelector:self.heightForFooterSelector
                                      withObject:section
                                      withObject:relsection];
        
        ret = [result floatValue];
    }
    
    return ret;
}

- (void)cellSelected:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection {
    if (self.target && self.cellSelectedSelector) {
        [self.target performSelector:self.cellSelectedSelector
                          withObject:indexPath
                          withObject:relsection];
    }
}

- (void)cellDeselected:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection {
    if (self.target && self.cellDeselectedSelector) {
        [self.target performSelector:self.cellDeselectedSelector
                          withObject:indexPath
                          withObject:relsection];
    }
}

- (UITableViewCellEditingStyle)editingStyle:(NSIndexPath *)indexPath
                                 relsection:(NSNumber *)relsection {
    if (self.target && self.editingStyleSelector) {
        return [[self.target performSelector:self.editingStyleSelector
                                  withObject:indexPath
                                  withObject:relsection] integerValue];
    }
    return UITableViewCellEditingStyleNone;
}

- (void)commitEditing:(NSIndexPath *)indexPath relsection:(NSNumber *)relsection {
    if (self.target && self.commitEditingSelector) {
        [self.target performSelector:self.commitEditingSelector
                          withObject:indexPath
                          withObject:relsection];
    }
}

- (NSString *)titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
                                                     relsection:(NSNumber *)relsection {
    if (self.target && self.titleForDeleteConfirmationButtonSelector) {
        return [self.target performSelector:self.titleForDeleteConfirmationButtonSelector
                                 withObject:indexPath
                                 withObject:relsection];
    }
    return @"删除";
}

@end
