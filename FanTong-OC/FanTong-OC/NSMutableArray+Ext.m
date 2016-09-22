//
//  NSMutableArray+Ext.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/21.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "NSMutableArray+Ext.h"

@implementation NSMutableArray (Ext)
- (void)arrayByInsertObjectsFromArray:(NSArray *)array
                              atIndex:(NSInteger)index{

    for (NSInteger i = 0; i < array.count; i++) {
        id object = array[array.count - i - 1];
        [self insertObject:object atIndex:0];
    }

}
@end
