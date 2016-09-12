//
//  Constant.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/7.
//  Copyright © 2016年 Kai. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

///------
/// NSLog
///------

#ifdef DEBUG
    #define NSLog(...) NSLog(__VA_ARGS__)
#else
    #define NSLog(...) {}
#endif

#endif /* Constant_h */


///-----
/// View
///-----
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


///------
/// Color
///------
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed : ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green : ((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue : ((float)(rgbValue & 0xFF)) / 255.0 alpha : 1.0]


///
/// 饭否oauth
///
#define OAUTH_CONSUMER_KEY @"c363d2d5b25fb7fe3e8d8e768eab5acf"
#define OAUTH_CONSUMER_SECRET @"ed4ff2f46b72ba3390739765c499e100"


///
/// 饭否URL
///
#define FANFOU_HOST @"fanfou.com"

//OAUTH
#define FANFOU_REQUEST_TOKEN_URL @"http://fanfou.com/oauth/request_token"
#define FANFOU_ACCESS_TOKEN_URL @"http://fanfou.com/oauth/access_token"
#define FANFOU_FRIENDS_IDS @"http://api.fanfou.com/friends/ids.json"
#define FANFOU_CONTEXT_TIMELINE @"http://api.fanfou.com/statuses/context_timeline.json"

//USERS
#define FANFOU_USERS_SHOW @"http://api.fanfou.com/users/show.json"

//Statuses
#define FANFOU_STATUSES_HOME_TIMELINE = "http://api.fanfou.com/statuses/home_timeline.json"
#define FANFOU_STATUSES_UPDATE = "/statuses/update.json"

