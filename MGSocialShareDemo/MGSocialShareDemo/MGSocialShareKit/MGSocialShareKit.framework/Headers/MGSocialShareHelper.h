//
//  MGSocialShareHelper.h
//  MGSocialShareKit
//
//  Created by Hosea Lee on 2018/4/17.
//  Copyright © 2018年 Hosea Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 分享结果状态码
 */
typedef NS_ENUM(NSUInteger, MGShareResponseErrorCode) {
    
    MGShareResponseErrorCode_Unknow            = 2000,            // 未知错误
    MGShareResponseErrorCode_NotSupport        = 2001,            // 没有配置-ObjC， 或则SDK版本不支持或则客户端版本不支持
    MGShareResponseErrorCode_AuthorizeFailed   = 2002,            // 授权失败
    MGShareResponseErrorCode_ShareFailed       = 2003,            // 分享失败
    MGShareResponseErrorCode_RequestForUserProfileFailed = 2004,  // 请求用户信息失败
    MGShareResponseErrorCode_ShareDataNil      = 2005,             // 分享内容为空
    MGShareResponseErrorCode_ShareDataTypeIllegal = 2006,          // 分享内容不支持
    MGShareResponseErrorCode_CheckUrlSchemaFail = 2007,            // schemaurl fail
    MGShareResponseErrorCode_NotInstall        = 2008,             // 应用未安装
    MGShareResponseErrorCode_Cancel            = 2009,             // 取消操作
    MGShareResponseErrorCode_NotNetWork        = 2010,             // 网络异常
    MGShareResponseErrorCode_SourceError       = 2011,             // 第三方错误
    
    MGShareResponseErrorCode_ProtocolNotOverride = 2013,   // 对应的    UMSocialPlatformProvider的方法没有实现
    MGShareResponseErrorCode_NotUsingHttps      = 2014,   // 没有用https的请求
    
};

typedef NS_ENUM(NSUInteger, MGShareToPlateform) {
    
    MGShareToWechatSession         = 0 ,        //分享到微信
    MGShareToWechatTimeline        =1  ,      //分享到微信朋友圈
    MGShareToWechatFavorite        =2  ,        //分享到微信收藏
    
    MGShareToQQ        =3  ,        //分享到QQ
    MGShareToQzone            =4  ,        //分享到QQ空间
    MGShareToTim           =5   ,        //分享到 tim
    
    MGShareToSina            =6  ,        //分享到新浪
    
    MGShareToDingDing       =7,      // 分享到钉钉
    
    MGShareToAlipay         =8,         // 分享到支付宝
    
    MGShareToRenRen         =9, // 分享到人人
    
    MGShareToDouban         =10, // 分享到豆瓣
    
    MGShareToSMS            =11, // 分享到短信
    
    MGShareToEmail           =12, // 分享到Email
    
    MGShareToYoudao         =13, // 分享到有道
    
    MGShareToEvernote           =14, // 分享到印象笔记
    
    MGShareToLaiWangSession         =15, // 分享到点点虫聊天
    MGShareToLaiWangTimeline            =16, // 分享到点点虫动态

    MGShareToLinkedin           =17, // 分享到领英
    
    MGShareToYixinSession           =18, // 分享到易信聊天
    MGShareToYixinTimeline          =19, // 分享到易信动态
    MGShareToYixinFavorite          =20 , // 分享到易信收藏

    MGShareToTecentWeibo            =21, // 分享到腾讯微博

};

typedef NS_ENUM(NSUInteger, MGShareContentType) {
    MGShareContentTypeUnknown      ,        //未知分享类型
    MGShareContentTypeText       ,        //分享文本
    MGShareContentTypeImage       ,        //分享图片
    MGShareContentTypeImageAndText          ,        //分享图文
    MGShareContentTypeWebPage              ,        //默认分享网页
    MGShareContentTypeMusic              ,        //分享音乐
    MGShareContentTypeVideo              ,        //分享视频
};


typedef void(^MGShareSuccessBlock)(void);

typedef void(^MGShareFailureBlock)(MGShareResponseErrorCode  errorCode);


@interface MGSocialShareModel : NSObject
/**
 标题
 */
@property (nonatomic, strong) NSString *title;

/**
 内容
 */
@property (nonatomic, strong) NSString *content;

/**
 内容浏览地址(分享网页)、音乐网页播放地址（分享音乐）、视频网页播放地址(分享视频)
 */
@property (nonatomic, strong) NSString *url;


/**
 分享图片（可以是UIImage类对象，也可以是NSdata类对象，也可以是图片链接imageUrl NSString类对象）
 * @note 图片大小根据各个平台限制而定
 */
@property (nonatomic, strong) id image;


/**
 图片下载失败会发送默认图片
 */
@property (nonatomic, strong) UIImage *thumbImage;

/**
 图片下载失败会发送默认图片
 */
@property (nonatomic, strong) UIImage *defaultImage;


/**
 分享内容类型
 */
@property (nonatomic, assign) MGShareContentType contentType;

@end


@interface MGSocialShareHelper : NSObject

+ (instancetype)defaultShareHelper;


/**
 初始化友盟设置  必须设置友盟appkey否则会崩溃

 @param umSocialAppkey 友盟Appkey
 @param umSocialAppSecret 友盟AppSecret
 @param isOpen 是否开启日志
 @param isUsingHttpsWhenShareContent 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
 
 <key>NSAppTransportSecurity</key>
 <dict>
 <key>NSAllowsArbitraryLoads</key>
 <true/>
 </dict>
 
 
 */
- (void)configWithUMAppKey:(NSString *)umSocialAppkey
         umSocialAppSecret:(NSString *)umSocialAppSecret
                   openLog:(BOOL)isOpen
usingHttpsWhenShareContent:(BOOL)isUsingHttpsWhenShareContent;

+ (void)configWithUMAppKey:(NSString *)umSocialAppkey
         umSocialAppSecret:(NSString *)umSocialAppSecret
                   openLog:(BOOL)isOpen
usingHttpsWhenShareContent:(BOOL)isUsingHttpsWhenShareContent;


/**
 初始化分享平台 平台参数参考友盟开发文档

 @param sharePlateform 需要分享的平台
 @param appKey appkey
 @param appSecret appSecret  不需要的话 nil
 @param redirectURL redirectURL 不需要的话 nil
 */
-(void)configSharePlateform:(MGShareToPlateform)sharePlateform
                 withAppKey:(NSString *)appKey
                  appSecret:(NSString *)appSecret
                redirectURL:(NSString *)redirectURL;

+(void)configSharePlateform:(MGShareToPlateform)sharePlateform
                 withAppKey:(NSString *)appKey
                  appSecret:(NSString *)appSecret
                redirectURL:(NSString *)redirectURL;



/**
 *  水印功能
 *  @note 此功能为6.2版本以后的功能
 *  @discuss 此函数默认关闭 NO - 关闭水印 YES - 打开水印
 *  @discuss 设置此函数为YES后，必须要使用下面的方法,来配置图片水印和字符串水印，如果不配置，就会用默认的来显示水印
 
 @param isUsingWaterMark 水印功能
 */
- (void)shareImageUsingWaterMark:(BOOL)isUsingWaterMark;

+ (void)shareImageUsingWaterMark:(BOOL)isUsingWaterMark;


/**
 配置水印

 @param warterMarkImage 水印图片
 
 @param warterMarkImageAlpha 水印图片相对父图片的缩放因素(0-1之间)
 
 @param warterMarkImageScale 水印图片的Alpha混合值
 
 @param paddingToHorizontalParentBorder 靠近水平边的边距
    与UMSocialWarterMarkPositon的停靠位置有关，
    如:为UMSocialImageWarterMarkBottomRight时，paddingToHorizontalParentBorder代表与父窗口的右边间隙.
    如:UMSocialImageWarterMarkTopLeft时，paddingToHorizontalParentBorder代表与父窗口的左边间隙.

 @param paddingToVerticalParentBorder 靠近垂直边的边距
    与UMSocialWarterMarkPositon的停靠位置有关，
    如:为UMSocialImageWarterMarkBottomRight时，paddingToHorizontalParentBorder代表与父窗口的下边间隙.
    如:UMSocialImageWarterMarkTopLeft时，paddingToHorizontalParentBorder代表与父窗口的上边间隙.
 */
- (void)configWaterMarkWithImage:(UIImage *)warterMarkImage
            warterMarkImageAlpha:(CGFloat)warterMarkImageAlpha
            warterMarkImageScale:(CGFloat)warterMarkImageScale
 paddingToHorizontalParentBorder:(CGFloat)paddingToHorizontalParentBorder
   paddingToVerticalParentBorder:(CGFloat)paddingToVerticalParentBorder;

+ (void)configWaterMarkWithImage:(UIImage *)warterMarkImage
            warterMarkImageAlpha:(CGFloat)warterMarkImageAlpha
            warterMarkImageScale:(CGFloat)warterMarkImageScale
 paddingToHorizontalParentBorder:(CGFloat)paddingToHorizontalParentBorder
   paddingToVerticalParentBorder:(CGFloat)paddingToVerticalParentBorder;

/**
 是否能够分享到平台

 @param sharePlatform 平台描述
 @return 结果
 */
- (BOOL)canBeShareToPlatform:(MGShareToPlateform )sharePlatform;

+ (BOOL)canBeShareToPlatform:(MGShareToPlateform )sharePlatform;


/**
 分享到平台
 
 @param model 分享内容
 @param sharePlatform  分享平台（MGShareToWechatSession，MGShareToWechatTimeline,）等
 @param controller Controller
 @param successBlock 成功
 @param failureBlock 失败
 */
- (void)shareMode:(MGSocialShareModel *)model
  toSharePlatform:(MGShareToPlateform )sharePlatform
 showInController:(UIViewController *)controller
     successBlock:(MGShareSuccessBlock)successBlock
     failureBlock:(MGShareFailureBlock)failureBlock;

+ (void)shareMode:(MGSocialShareModel *)model
  toSharePlatform:(MGShareToPlateform )sharePlatform
 showInController:(UIViewController *)controller
     successBlock:(MGShareSuccessBlock)successBlock
     failureBlock:(MGShareFailureBlock)failureBlock;
#pragma mark 回调

/**
    // 支持所有iOS系统
     //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响

 - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
 {
    BOOL result = [MGSocialShareHelper mg_handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
 }

 
 @param url url
 @param sourceApplication sourceApplication
 @param annotation annotation
 @return result
 */
- (BOOL)mg_handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

+ (BOOL)mg_handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;


/**
    仅支持iOS9以上系统，iOS8及以下系统不会回调
 
    6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
 
 - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
 {
    BOOL result = [MGSocialShareHelper mg_handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
 }
 

 @param url url
 @param options options
 @return result
 */
- (BOOL)mg_handleOpenURL:(NSURL *)url options:(NSDictionary *)options;

+ (BOOL)mg_handleOpenURL:(NSURL *)url options:(NSDictionary *)options;


/**
 方法弃用
 - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
 {
    BOOL result = [MGSocialShareHelper  mg_handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
 }

 @param url url
 @return result
 */
- (BOOL)mg_handleOpenURL:(NSURL *)url;

+ (BOOL)mg_handleOpenURL:(NSURL *)url;

@end
