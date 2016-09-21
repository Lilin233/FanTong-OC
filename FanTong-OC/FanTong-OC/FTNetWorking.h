//
//  FTNetWorking.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/19.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, RequestType) {
    GET = 0,
    POST,
    DELETE
};


@interface FTNetWorking : NSObject

+ (NSURLSessionTask *)requestRemoteDataWithRequest:(NSURLRequest*) request
                          returnJSON:(BOOL)returnJson
                            complete:(completeBlock)completeBlock;

@end
