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
        NSLog(@"username:%@", username);
        NSLog(@"password:%@", password);
        return @(username.length > 0 && password.length > 0);
    }] distinctUntilChanged];
    
//    self.loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
//        @strongify(self)
//        return nil;
//    }];
}

- (void)loginFanfou{
    NSMutableURLRequest *URLRequest = [[TDOAuth URLRequestForPath:@"/oauth/access_token" GETParameters:@{@"x_auth_username": self.username, @"x_auth_password": self.password,  @"x_auth_mode": @"client_auth"} host:FANFOU_HOST consumerKey:OAUTH_CONSUMER_KEY consumerSecret:OAUTH_CONSUMER_SECRET accessToken:nil tokenSecret:nil] mutableCopy];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 20;
    configuration.timeoutIntervalForResource = 20;
    
    
    [[[NSURLSession sessionWithConfiguration:configuration] dataTaskWithRequest:URLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if (!error && ![responseString containsString:@"<error>"]) {
            
            NSRange startRange = [responseString rangeOfString:@"oauth_token="];
            NSRange endRange = [responseString rangeOfString:@"&oauth_token_secret="];
            
            NSRange tokenRange = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
            NSString *token = [responseString substringWithRange:tokenRange];
            NSString *secret = [responseString substringFromIndex:endRange.location + endRange.length];
            NSLog(@"%@ %@", token, secret);
        } else {
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSRange startRange = [responseString rangeOfString:@"<error>"];
            NSRange endRange = [responseString rangeOfString:@"</error>"];
            if (startRange.location && endRange.location && endRange.location > startRange.location) {
                NSString *error = [responseString substringWithRange:NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length)];
                NSLog(@"error=====%@", error);
                
            } else {
                NSLog(@"网络故障了");
            }
        }
    }] resume];

}
@end
