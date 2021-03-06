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
/// Global
///-----
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define NAVICATIONBAR_HEIGHT 44
#define STATUSBAR_HEIGHT 20
#define TABBAR_HEIGHT 49
#define MBPROGRESSHUD_LABEL_TEXT @"Loading..."
#define SCHEME_HTTP @"http"
#define REQUEST_TYPE_GET @"GET"
#define REQUEST_TYPE_POST @"POST"

///-----
/// Status
///-----

#define kStatusTitleFont [UIFont fontWithName:@"FZQingKeBenYueSongS-R-GB" size:18.f]
#define kStatusContentFont [UIFont boldSystemFontOfSize:20]
#define kStatusDateFont [UIFont systemFontOfSize:14.f]
///< 头像高度
static CGFloat const kStatusAvatarHeight = 40;
static CGFloat const kStatusAvatarCornerRadius = 6;
///< cell顶部留白
static CGFloat const kStatusAvatarMarginTop = 10;
///< cell左侧留白
static CGFloat const kStatusAvatarMarginLeft = 15;
///< 内容离标题留白
static CGFloat const kStatusContentPadding = 10;
///< status 图片高度
static CGFloat const kStatusImageViewHeight = 240;
///< status 工具栏高度
static CGFloat const kStatusToolbarHeight = 40;
///< status 工具栏按钮高度
static CGFloat const kStatusTollbarButtonWidth = 60;
///< status 内容宽度
#define kStatusContetnWidth SCREEN_WIDTH - kStatusAvatarMarginLeft * 2
///< status date 宽度
static CGFloat const kStatusDateWidth = 160;
/// status分页数
#define kStatusCount @40

///-----
/// Direct Message
///-----
static CGFloat const kDirectMessageConversationListHeight = 60;
static CGFloat const kDirectMessageConversationListAvatarHeight = 40;
#define kDirectMessageConversationListAvatarTopMarge (kDirectMessageConversationListHeight - kDirectMessageConversationListAvatarHeight) / 2
static CGFloat const kDirectMessageConversationListSenderHeight = 25;
static CGFloat const kDirectMessageConversationListSenderWidth = 200;
static CGFloat const kDirectMessageConversationListSenderTopMargin = 10;
static CGFloat const kDirectMessageConversationListContentHeight = 20;
#define kDirectMessageConversationListSenderFont [UIFont systemFontOfSize:18]
#define kDirectMessageConversationListContentFont [UIFont systemFontOfSize:14]



///------
/// Color
///------
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed : ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green : ((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue : ((float)(rgbValue & 0xFF)) / 255.0 alpha : 1.0]
#define HTML_LINK_COLOR UIColorFromRGB(0x1b9bf0)

///-----------
/// SSKeychain
///-----------
#define FT_RAW_LOGIN @"RawLogin"
#define FT_PASSWORD  @"PASSWORD"
#define FT_SERVICE_NAME @"com.CocoaThinking.FanTong-OC"
#define FT_ACCESS_TOKEN @"AccessToken"
#define FT_SECRET @"Secret"

///
/// Block
///
typedef void (^completeBlock)(id responseObject, NSError *error);
typedef void (^successBlock)(id responseObject);
typedef void (^faildBlock)(NSError *error);
///
/// 饭否oauth
///
#define FANFOU_OAUTH_CONSUMER_KEY @"c363d2d5b25fb7fe3e8d8e768eab5acf"
#define FANFOU_OAUTH_CONSUMER_SECRET @"ed4ff2f46b72ba3390739765c499e100"

///
/// 饭否URL
///
#define FANFOU_HOST @"fanfou.com"
#define FANFOU_API_HOST @"api.fanfou.com"

//OAUTH
#define FANFOU_REQUEST_TOKEN_URL @"http://fanfou.com/oauth/request_token"
#define FANFOU_ACCESS_TOKEN_URL @"/oauth/access_token"
#define FANFOU_FRIENDS_IDS @"http://api.fanfou.com/friends/ids.json"
#define FANFOU_CONTEXT_TIMELINE @"http://api.fanfou.com/statuses/context_timeline.json"

//USERS
#define FANFOU_USERS_SHOW @"http://api.fanfou.com/users/show.json"

//ACCOUNT
#define FANFOU_VERIFY_CRDENTIALS @"/account/verify_credentials.json"

//Statuses
#define FANFOU_STATUSES_HOME_TIMELINE  @"/statuses/home_timeline.json"
#define FANFOU_STATUSES_UPDATE  @"/statuses/update.json"


//direct message
#define FANFOU_DIRECT_MESSAGE_CONVERSATION_LIST @"/direct_messages/conversation_list.json"
#define FANFOU_DIRECT_MESSAGE_CONVERSATION @"/direct_messages/conversation.json"
#define FANFOU_DIRECT_MESSAGE_CONVERSATION_NEW @"/direct_messages/new.json"
#define FANFOU_DIRECT_MESSAGE_CONVERSATION_DESTORY  @"/direct_messages/destroy.json"
