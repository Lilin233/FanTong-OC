//
//  NSMutableArray+Ext.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/21.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Ext)
- (void)arrayByInsertObjectsFromArray:(NSArray *)array
                              atIndex:(NSInteger)index;
@end
