//
//  FTNetWorking.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/19.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTNetWorking.h"

@implementation FTNetWorking
+ (NSURLSessionTask *)requestRemoteDataWithRequest:(NSURLRequest*) request
                          returnJSON:(BOOL)returnJson
                            complete:(completeBlock)completeBlock{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 20;
    configuration.timeoutIntervalForResource = 20;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:configuration];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/x-www-form-urlencoded",
                                                                              @"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    
    if (!returnJson) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
    }
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completeBlock(responseObject, error);
    }];
    [task resume];
    
    return task;
}
@end
