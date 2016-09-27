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
    self.shouldPullToRefresh = YES;
    self.requestRemoteDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"20", @"count",nil];
            
//            if (input != nil && input == self.datasource.lastObject) {
//                [parameters setObject:((FTTimelineCellViewModel *)input).status.status_id forKey:@"max_id"];
//                [parameters setObject:kStatusCount forKey:@"count"];
//                
//            }else if(input != nil && input == self.datasource.firstObject){
//                [parameters setObject:((FTTimelineCellViewModel *)input).status.status_id forKey:@"since_id"];
//                
//            }else{
//                [parameters setObject:kStatusCount forKey:@"count"];
//            }
            
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
                    if (input != nil) {
                        if (input == self.datasource.lastObject) {
                            self.datasource = [self.datasource arrayByAddingObjectsFromArray:[itemArray copy]];
                            
                        }else if(input == self.datasource.firstObject){
                            [[self.datasource mutableCopy] arrayByInsertObjectsFromArray:[itemArray copy] atIndex:0];
                            
                        }
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
