# MGSocialShareKit
<<<<<<< HEAD

[![CI Status](http://img.shields.io/travis/HoseaLeee/MGSocialShareKit.svg?style=flat)](https://travis-ci.org/HoseaLeee/MGSocialShareKit)
[![Version](https://img.shields.io/cocoapods/v/MGSocialShareKit.svg?style=flat)](http://cocoapods.org/pods/MGSocialShareKit)
[![License](https://img.shields.io/cocoapods/l/MGSocialShareKit.svg?style=flat)](http://cocoapods.org/pods/MGSocialShareKit)
[![Platform](https://img.shields.io/cocoapods/p/MGSocialShareKit.svg?style=flat)](http://cocoapods.org/pods/MGSocialShareKit)

## 前言
=======
>>>>>>> 343dc754c16e386593d6648f0337c9d5011a1861

[![CI Status](http://img.shields.io/travis/HoseaLeee/MGSocialShareKit.svg?style=flat)](https://travis-ci.org/HoseaLeee/MGSocialShareKit)
[![Version](https://img.shields.io/cocoapods/v/MGSocialShareKit.svg?style=flat)](http://cocoapods.org/pods/MGSocialShareKit)
[![License](https://img.shields.io/cocoapods/l/MGSocialShareKit.svg?style=flat)](http://cocoapods.org/pods/MGSocialShareKit)
[![Platform](https://img.shields.io/cocoapods/p/MGSocialShareKit.svg?style=flat)](http://cocoapods.org/pods/MGSocialShareKit)

## 前言

MGSocialShareKit 基于[友盟社会化分享](https://mobile.umeng.com/social) 封装的 iOS 分享库，意在解决项目组件化过程中遇到的 Pod 库中 UMengSocial 5.0出现的各种问题，以及Objective-C、swift混合项目中静态库编译错误问题。
> [!] The 'XXX' target has transitive dependencies that include static binaries: (.../xxx.a)

## 支持平台

微信、QQ、新浪微博、钉钉、支付宝、人人网、豆瓣、短信、邮件、有道云笔记、印象笔记、点点虫、领英、易信/朋友圈、腾讯微博

## 安装要求

iOS 8以上

## 安装

你可以在 Podfile 中加入下面一行代码来使用 MGSocialShareKit

   pod 'MGSocialShareKit'

然后运行命令：
  $ pod install


## 对应友盟SDK版本

| MGSocialShareKit 版本 | 友盟SDK 版本 |
|:-----:|:-----|
| 1.0.0 | 6.9.0 |

## 相关的使用教程和 Demo

 * [配置SSO白名单](https://developer.umeng.com/docs/66632/detail/66825)
 
如果你的应用使用了如SSO授权登录或跳转到第三方分享功能，在iOS9/10下就需要增加一个可跳转的白名单，即LSApplicationQueriesSchemes，否则将在SDK判断是否跳转时用到的canOpenURL时返回NO，进而只进行webview授权或授权/分享失败。在项目中的info.plist中加入应用白名单，右键info.plist选择source code打开(plist具体设置在Build Setting -> Packaging -> Info.plist File可获取plist路径)请根据选择的平台对以下配置进行裁剪：
```
<key>LSApplicationQueriesSchemes</key>
	<array>
  
        <!-- 微信 URL Scheme 白名单-->
        <string>wechat</string>
        <string>weixin</string>
        
        <!-- 新浪微博 URL Scheme 白名单-->
        <string>sinaweibohd</string>
        <string>sinaweibo</string>
        <string>sinaweibosso</string>
        <string>weibosdk</string>
        <string>weibosdk2.5</string>
        
        <!-- QQ、Qzone URL Scheme 白名单-->
        <string>mqqapi</string>
        <string>mqq</string>
        <string>mqqOpensdkSSoLogin</string>
        <string>mqqconnect</string>
        <string>mqqopensdkdataline</string>
        <string>mqqopensdkgrouptribeshare</string>
        <string>mqqopensdkfriend</string>
        <string>mqqopensdkapi</string>
        <string>mqqopensdkapiV2</string>
        <string>mqqopensdkapiV3</string>
        <string>mqqopensdkapiV4</string>
        <string>mqzoneopensdk</string>
        <string>wtloginmqq</string>
        <string>wtloginmqq2</string>
        <string>mqqwpa</string>
        <string>mqzone</string>
        <string>mqzonev2</string>
        <string>mqzoneshare</string>
        <string>wtloginqzone</string>
        <string>mqzonewx</string>
        <string>mqzoneopensdkapiV2</string>
        <string>mqzoneopensdkapi19</string>
        <string>mqzoneopensdkapi</string>
        <string>mqqbrowser</string>
        <string>mttbrowser</string>
        <string>tim</string>
        <string>timapi</string>
        <string>timopensdkfriend</string>
        <string>timwpa</string>
        <string>timgamebindinggroup</string>
        <string>timapiwallet</string>
        <string>timOpensdkSSoLogin</string>
        <string>wtlogintim</string>
        <string>timopensdkgrouptribeshare</string>
        <string>timopensdkapiV4</string>
        <string>timgamebindinggroup</string>
        <string>timopensdkdataline</string>
        <string>wtlogintimV1</string>
        <string>timapiV1</string>
        
        <!-- 支付宝 URL Scheme 白名单-->
        <string>alipay</string>
        <string>alipayshare</string>
        
        <!-- 钉钉 URL Scheme 白名单-->
        <string>dingtalk</string>
        <string>dingtalk-open</string>
        
        <!--Linkedin URL Scheme 白名单-->
        <string>linkedin</string>
        <string>linkedin-sdk2</string>
        <string>linkedin-sdk</string>
        
        <!-- 点点虫 URL Scheme 白名单-->
        <string>laiwangsso</string>
        
        <!-- 易信 URL Scheme 白名单-->
        <string>yixin</string>
        <string>yixinopenapi</string>

        <!-- 人人 URL Scheme 白名单-->
        <string>renrenios</string>
        <string>renrenapi</string>
        <string>renren</string>
        <string>renreniphone</string>

        <!-- 印象笔记 -->
        <string>evernote</string>
        <string>en</string>
        <string>enx</string>
        <string>evernotecid</string>
        <string>evernotemsg</string>
        
        <!-- 有道云笔记-->
        <string>youdaonote</string>
        <string>ynotedictfav</string>
        <string>com.youdao.note.todayViewNote</string>
        <string>ynotesharesdk</string>

	</array>
```
 * [配置URL Scheme](https://developer.umeng.com/docs/66632/detail/66825)
 
 URL Scheme参照友盟开发文档进行配置。
 
 * 使用 MGSocialShareKit 进行分享
 
 1.初始化
 ```
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


[MGSocialShareHelper configWithUMAppKey:@"5a337f9ba40fa3606c000102" umSocialAppSecret:@"" openLog:YES usingHttpsWhenShareContent:NO];
     
 ```
 
 2.配置分享平台
 ```
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
                
                
[MGSocialShareHelper configSharePlateform:MGShareToWechatSession withAppKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];                
 ```
 创建分享对象，目前支持分享的类型有 文字、图片、图文、网页、音乐以及视频
 ```
  MGSocialShareModel *shareModel = [[MGSocialShareModel alloc]  init];

    switch (sender.tag) {
        case 0:// 文本
            {
                shareModel.contentType = MGShareContentTypeText;
                shareModel.content = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
            }
            break;
        case 1:// 图片
        {
            shareModel.contentType = MGShareContentTypeImage;
            shareModel.thumbImage = [UIImage imageNamed:@""];
            shareModel.image = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
        }
            break;
        case 2:// 图文
        {
            shareModel.contentType = MGShareContentTypeImageAndText;
            shareModel.content = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
            shareModel.thumbImage = [UIImage imageNamed:@""];
            shareModel.image = @"https://www.umeng.com/img/index/demo/1104.4b2f7dfe614bea70eea4c6071c72d7f5.jpg";
        }
            break;
        case 3:// 网页
        {
            shareModel.contentType = MGShareContentTypeWebPage;
            shareModel.title = @"分享网页";
            shareModel.content = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
            shareModel.thumbImage = [UIImage imageNamed:@""];
            shareModel.url = @"http://mobile.umeng.com/social";
        }
            break;
        case 4:// 音乐
        {
            shareModel.contentType = MGShareContentTypeMusic;
            shareModel.title = @"分享音乐";
            shareModel.content = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
            shareModel.thumbImage = [UIImage imageNamed:@""];
            shareModel.url = @"http://c.y.qq.com/v8/playsong.html?songid=108782194&source=yqq#wechat_redirect";
        }
            break;
        case 5:// 视频
        {
            shareModel.contentType = MGShareContentTypeVideo;
            shareModel.title = @"分享视频";
            shareModel.content = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
            shareModel.thumbImage = [UIImage imageNamed:@""];
            shareModel.url = @"http://video.sina.com.cn/p/sports/cba/v/2013-10-22/144463050817.html";
        }
            break;
        default:
            break;
    }
    
 ```
 3.调用分享
 ```
 
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
     
     
     
  [[MGSocialShareHelper defaultShareHelper]  shareMode:shareModel toSharePlatform:MGShareToWechatSession showInController:self successBlock:^{
                NSLog(@"分享成功");
            } failureBlock:^(MGShareResponseErrorCode errorCode) {
                NSLog(@"分享失败---- errorCode = %lu",(unsigned long)errorCode);

            }];
 ```
 
 4.别急，还有。添加水印
 ```
 /**
 *  水印功能
 *  @note 此功能为6.2版本以后的功能
 *  @discuss 此函数默认关闭 NO - 关闭水印 YES - 打开水印
 *  @discuss 设置此函数为YES后，必须要使用下面的方法,来配置图片水印和字符串水印，如果不配置，就会用默认的来显示水印
 
 @param isUsingWaterMark 水印功能
 */
- (void)shareImageUsingWaterMark:(BOOL)isUsingWaterMark;



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

 ```
## 后记

由于账号问题一些平台的测试未进行。

## 协议

MGSocialShareKit 被许可在 MIT 协议下使用。查阅 LICENSE 文件来获得更多信息。
