//
//  FTConversationViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/27.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTConversationViewModel.h"
#import "FTDirectMessageCellViewModel.h"
#import "FTConversationCellViewModel.h"
@implementation FTConversationViewModel
- (instancetype)initWithParams:(NSDictionary *)params{
    self = [super initWithParams:params];
    if (self) {
        
    }
    return self;
    
}
- (void)initialize{
    self.shouldPullToRefresh = YES;
    self.requestRemoteDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"60", @"count", (NSString *)input, @"id",nil];
            
            NSMutableURLRequest *URLRequest = [[TDOAuth URLRequestForPath:FANFOU_DIRECT_MESSAGE_CONVERSATION parameters:parameters host:FANFOU_API_HOST consumerKey:FANFOU_OAUTH_CONSUMER_KEY consumerSecret:FANFOU_OAUTH_CONSUMER_SECRET accessToken:[SSKeychain accessToken] tokenSecret:[SSKeychain secret] scheme:SCHEME_HTTP requestMethod:REQUEST_TYPE_GET dataEncoding:TDOAuthContentTypeUrlEncodedForm headerValues:nil signatureMethod:TDOAuthSignatureMethodHmacSha1] mutableCopy];
            
            NSURLSessionTask *task = [FTNetWorking requestRemoteDataWithRequest:URLRequest returnJSON:YES complete:^(id responseObject, NSError *error) {
                NSMutableArray *itemArray = [@[] mutableCopy];
                if (error) {
                    NSLog(@"%@", error);
                    [subscriber sendError:error];
                }else{
                    for (NSDictionary *dic in responseObject) {
                        DirectMessage *dm = [DirectMessage modelWithJSON:dic];
                        FTConversationCellViewModel *viewModel = [[FTConversationCellViewModel alloc]initWitDirectMessageModel:dm];
                        [itemArray insertObject:viewModel atIndex:0];
                    }
                    self.datasource = [itemArray copy];
                    [subscriber sendCompleted];
                    
                    
                }
            }];
            return [RACDisposable disposableWithBlock:^{
                [task cancel];
            }];
        }];
        return signal;
    }];
}
@end
