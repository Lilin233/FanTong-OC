//
//  FTModels.h
//  FanTong-OC
//
//  Created by Kai Liu on 16/9/14.
//  Copyright © 2016年 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Photo;

@interface FTModels : NSObject

@end

@interface Status : NSObject

/// 消息发送时间
@property (nonatomic, copy)NSString *created_at;

/// 消息id
@property (nonatomic, copy)NSString *status_id;

/// 消息序列号（可用来排序）
@property (nonatomic, assign)NSInteger *rawid;

/// 消息内容
@property (nonatomic, copy)NSString *text;

/// 消息来源
@property (nonatomic, copy)NSString *source;

/// 消息是否被拦截
@property (nonatomic, copy)NSString *truncated;

/// 回复的消息id
@property (nonatomic, copy)NSString *in_reply_to_status_id;

/// 回复的用户id
@property (nonatomic, copy)NSString *in_reply_to_user_id;

/// 转发的消息id
@property (nonatomic, copy)NSString *repost_status_id;

/// 转发的消息详细信息
@property (nonatomic, strong)Status *repost_status;

/// 转发的用户id
@property (nonatomic, copy)NSString *repost_user_id;

/// 消息的位置，格式可能是"北京 朝阳区"也可能是"234.333,47.9"
@property (nonatomic, copy)NSString *location;

/// 消息是否被登录用户收藏
@property (nonatomic, assign)BOOL *favorited;

/// 回复用户的昵称
@property (nonatomic, copy)NSString *in_reply_to_screen_name;

/// 发送此消息之用户信息
//@property (nonatomic, strong)User *user;

/// 消息中图片信息
@property (nonatomic, strong)Photo *photo;

@end

@interface Photo : NSObject

@property (nonatomic, copy)NSString *imageurl;
@property (nonatomic, copy)NSString *thumburl;
@property (nonatomic, copy)NSString *largeurl;

@end

@interface User : NSObject

///< 用户id
@property (nonatomic, copy)NSString *user_id;

///< 用户姓名
@property (nonatomic, copy)NSString *name;

///< 用户昵称
@property (nonatomic, copy)NSString *screen_name;

///< 用户地址
@property (nonatomic, copy)NSString *location;

///< 用户性别
@property (nonatomic, copy)NSString *gender;

///< 用户生日信息
@property (nonatomic, copy)NSString *birthday;

///< 用户自述
@property (nonatomic, copy)NSString *descriptions;


//    var descriptions: String = ""
//    ///< 用户头像地址
//    var profile_image_url: String = ""
//    ///< 用户高清头像地址
//    var profile_image_url_large: String = ""
//    ///< 用户页面地址
//    var url: String = ""
//    ///< 用户是否设置隐私保护
//    var protected: Bool = false
//    ///< 用户关注用户数
//    var followers_count: Int = 0
//    ///< 用户好友数
//    var friends_count: Int = 0
//    ///< 用户收藏消息数
//    var favourites_count: Int = 0
//    ///< 用户消息数
//    var statuses_count: Int = 0
//    ///< 该用户是被当前登录用户关注
//    var following: Bool = false
//    ///< 当前登录用户是否已对该用户发出关注请求
//    var notifications: Bool = false
//    ///< 用户注册时间
//    var created_at: String = ""
//    ///< ref: UTC offset
//    var utc_offset: Int = 0
//    ///< 用户用户自定义页面背景颜色
//    var profile_background_color: String = ""
//    ///< 用户用户自定义文字颜色
//    var profile_text_color: String = ""
//    ///< 用户用户自定义链接颜色
//    var profile_link_color: String = ""
//    ///< 用户用户自定义侧边栏颜色
//    var profile_sidebar_fill_color: String = ""
//    ///< 用户用户自定义侧边栏边框颜色
//    var profile_sidebar_border_color: String = ""
//    ///< 用户用户自定义背景图片地址
//    var profile_background_image_url: String = ""
//    ///< 是否平铺用户用户自定义背景图片地址
//    var profile_background_tile: Bool = false
//    ///< Status
//    var status: Status?


@end

//class User:NSObject {
//    override init() {
//        super.init()
//    }
//    ///< 用户id
//    var id: String = ""
//    ///< 用户姓名
//    var name: String = ""
//    ///< 用户昵称
//    var screen_name: String = ""
//    ///< 用户地址
//    var location: String = ""
//    ///< 用户性别
//    var gender: String = ""
//    ///< 用户生日信息
//    var birthday: String = ""
//    ///< 用户自述
//    var descriptions: String = ""
//    ///< 用户头像地址
//    var profile_image_url: String = ""
//    ///< 用户高清头像地址
//    var profile_image_url_large: String = ""
//    ///< 用户页面地址
//    var url: String = ""
//    ///< 用户是否设置隐私保护
//    var protected: Bool = false
//    ///< 用户关注用户数
//    var followers_count: Int = 0
//    ///< 用户好友数
//    var friends_count: Int = 0
//    ///< 用户收藏消息数
//    var favourites_count: Int = 0
//    ///< 用户消息数
//    var statuses_count: Int = 0
//    ///< 该用户是被当前登录用户关注
//    var following: Bool = false
//    ///< 当前登录用户是否已对该用户发出关注请求
//    var notifications: Bool = false
//    ///< 用户注册时间
//    var created_at: String = ""
//    ///< ref: UTC offset
//    var utc_offset: Int = 0
//    ///< 用户用户自定义页面背景颜色
//    var profile_background_color: String = ""
//    ///< 用户用户自定义文字颜色
//    var profile_text_color: String = ""
//    ///< 用户用户自定义链接颜色
//    var profile_link_color: String = ""
//    ///< 用户用户自定义侧边栏颜色
//    var profile_sidebar_fill_color: String = ""
//    ///< 用户用户自定义侧边栏边框颜色
//    var profile_sidebar_border_color: String = ""
//    ///< 用户用户自定义背景图片地址
//    var profile_background_image_url: String = ""
//    ///< 是否平铺用户用户自定义背景图片地址
//    var profile_background_tile: Bool = false
//    ///< Status
//    var status: Status?
//    
//    func modelCustomPropertyMapper() -> NSDictionary{
//        return NSDictionary(dictionary: ["descriptions" : "description"])
//    }
