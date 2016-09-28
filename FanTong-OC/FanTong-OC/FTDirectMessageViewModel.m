//
//  FTDirectMessageViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/26.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTDirectMessageViewModel.h"
#import "FTDirectMessageCellViewModel.h"
@implementation FTDirectMessageViewModel
- (instancetype)initWithParams:(NSDictionary *)params{
    self = [super initWithParams:params];
    if (self) {
        
    }
    return self;
    
}
- (void)initialize{
    self.requestRemoteDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(NSNumber *input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithObjectsAndKeys:kStatusCount, @"count", input, @"page", nil];
            NSMutableURLRequest *URLRequest = [[TDOAuth URLRequestForPath:FANFOU_DIRECT_MESSAGE_CONVERSATION_LIST parameters:parameters host:FANFOU_API_HOST consumerKey:FANFOU_OAUTH_CONSUMER_KEY consumerSecret:FANFOU_OAUTH_CONSUMER_SECRET accessToken:[SSKeychain accessToken] tokenSecret:[SSKeychain secret] scheme:SCHEME_HTTP requestMethod:REQUEST_TYPE_GET dataEncoding:TDOAuthContentTypeUrlEncodedForm headerValues:nil signatureMethod:TDOAuthSignatureMethodHmacSha1] mutableCopy];
            
            NSURLSessionTask *task = [FTNetWorking requestRemoteDataWithRequest:URLRequest returnJSON:YES complete:^(id responseObject, NSError *error) {
                NSMutableArray *itemArray = [@[] mutableCopy];
                if (error) {
                    NSLog(@"%@", error);
                    [subscriber sendError:error];
                }else{
                    for (NSDictionary *dic in responseObject) {
                        ConversationList *listModel = [ConversationList modelWithJSON:dic];
                        FTDirectMessageCellViewModel *viewModel = [[FTDirectMessageCellViewModel alloc]initWitDirectMessageModel:listModel];
                        [itemArray addObject:viewModel];
                    }
                    if (input.integerValue > 1) {
                        self.datasource = [self.datasource arrayByAddingObjectsFromArray:[itemArray copy]];
                    }else{
                        self.datasource = [itemArray copy];
                    }
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
