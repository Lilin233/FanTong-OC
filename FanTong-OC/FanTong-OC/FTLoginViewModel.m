//
//  FTLoginViewModel.m
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/7.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import "FTLoginViewModel.h"
@implementation FTLoginViewModel

- (void)initialize {
    [super initialize];
    @weakify(self)
    self.validLoginSignal = [[RACSignal combineLatest:@[RACObserve(self, username), RACObserve(self, password)] reduce:^(NSString *username, NSString *password){
        return @(username.length > 0 && password.length > 0);
    }] distinctUntilChanged];
    
    self.loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        return [self loginFanfouSignal];
    }];
}

- (RACSignal *)loginFanfouSignal{
    @weakify(self)
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self)
        NSMutableURLRequest *URLRequest = [[TDOAuth URLRequestForPath:FANFOU_ACCESS_TOKEN_URL GETParameters:@{@"x_auth_username": self.username, @"x_auth_password": self.password,  @"x_auth_mode": @"client_auth"} host:FANFOU_HOST consumerKey:FANFOU_OAUTH_CONSUMER_KEY consumerSecret:FANFOU_OAUTH_CONSUMER_SECRET accessToken:nil tokenSecret:nil] mutableCopy];
        
        NSURLSessionTask *task = [FTNetWorking requestRemoteDataWithRequest:URLRequest returnJSON:NO complete:^(id responseObject, NSError *error) {
            NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            if (!error && ![responseString containsString:@"<error>"]) {
                
                NSRange startRange = [responseString rangeOfString:@"oauth_token="];
                NSRange endRange = [responseString rangeOfString:@"&oauth_token_secret="];
                
                NSRange tokenRange = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
                NSString *token = [responseString substringWithRange:tokenRange];
                NSString *secret = [responseString substringFromIndex:endRange.location + endRange.length];
                
                [SSKeychain setRawLogin:self.username];
                [SSKeychain setPassword:self.password];
                [SSKeychain setAccessToken:token];
                [SSKeychain setSecret:secret];
                
                [subscriber sendCompleted];
                UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                UIViewController *rootNaviVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"rootNavicationController"];
                UIWindow *window = [UIApplication sharedApplication].keyWindow;
                window.rootViewController = rootNaviVC;
                
            } else {
                NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSRange startRange = [responseString rangeOfString:@"<error>"];
                NSRange endRange = [responseString rangeOfString:@"</error>"];
                if (startRange.location && endRange.location && endRange.location > startRange.location) {
                    NSString *error = [responseString substringWithRange:NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length)];
                    NSLog(@"error=====%@", error);
                    
                } else {
                    NSLog(@"网络故障了");
                }
                [subscriber sendError:error];
                
            }

        }];
                
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];

    return signal;
}
                        
//    [[[NSURLSession sessionWithConfiguration:configuration] dataTaskWithRequest:URLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        if (!error && ![responseString containsString:@"<error>"]) {
//            
//            NSRange startRange = [responseString rangeOfString:@"oauth_token="];
//            NSRange endRange = [responseString rangeOfString:@"&oauth_token_secret="];
//            
//            NSRange tokenRange = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
//            NSString *token = [responseString substringWithRange:tokenRange];
//            NSString *secret = [responseString substringFromIndex:endRange.location + endRange.length];
//            NSLog(@"%@ %@", token, secret);
//        } else {
//            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSRange startRange = [responseString rangeOfString:@"<error>"];
//            NSRange endRange = [responseString rangeOfString:@"</error>"];
//            if (startRange.location && endRange.location && endRange.location > startRange.location) {
//                NSString *error = [responseString substringWithRange:NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length)];
//                NSLog(@"error=====%@", error);
//                
//            } else {
//                NSLog(@"网络故障了");
//            }
//        }
//    }] resume];

//}
@end
