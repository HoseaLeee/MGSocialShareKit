//
//  ViewController.m
//  MGSocialShareDemo
//
//  Created by Hosea Lee on 2018/4/17.
//  Copyright © 2018年 Hosea Lee. All rights reserved.
//

#import "ViewController.h"
#import <MGSocialShareKit/MGSocialShareKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MGSocialShareKit";
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)shareAction:(UIButton *)sender {
    
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
    
    [self shareSelectedPlateformActionWithShareModel:shareModel];
    
}

- (void)shareSelectedPlateformActionWithShareModel:(MGSocialShareModel *)shareModel
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"分享到" message:@"请选择平台" preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < [self getSharePlateformName].count ; i++) {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:[self getSharePlateformName][i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [[MGSocialShareHelper defaultShareHelper]  shareMode:shareModel toSharePlatform:i showInController:self successBlock:^{
                NSLog(@"分享成功");
            } failureBlock:^(MGShareResponseErrorCode errorCode) {
                NSLog(@"分享到%@失败---- errorCode = %lu",[self getSharePlateformName][i],(unsigned long)errorCode);

            }];
            
        }];
        [alert addAction:alertAction];
    }
    [self presentViewController:alert animated:YES completion:nil];
}

- (NSArray *)getSharePlateformName
{
    return [NSArray arrayWithObjects:@"分享到微信",@"分享到微信朋友圈",@"分享到微信收藏",@"分享到QQ",@"分享到QQ空间",@"分享到 tim",@"分享到新浪",@"分享到钉钉",@"分享到支付宝",@" 分享到人人",@"分享到豆瓣",@"分享到短信",@"分享到Email",@"分享到有道",@"分享到印象笔记",@"分享到点点虫聊天",@"分享到点点虫动态",@" 分享到领英",@" 分享到易信聊天",@"分享到易信动态",@"分享到易信收藏",@"分享到腾讯微博", nil];
}
- (IBAction)shareByWechat:(id)sender {
    
    
    MGSocialShareModel *shareModel = [[MGSocialShareModel alloc]  init];
    shareModel.title = @"分享标题";
    shareModel.content = @"分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容";
    shareModel.url = @"https://developer.umeng.com/docs/66632/detail/66825#h3-u65B0u6D6Au5FAEu535A";

    [[MGSocialShareHelper defaultShareHelper]  shareMode:shareModel toSharePlatform:MGShareToWechatSession showInController:self successBlock:^{
        
    } failureBlock:^(MGShareResponseErrorCode errorCode) {
        
    }];

}

- (IBAction)shareByQQ:(id)sender {
//    ShareHelperModel *shareModel = [[ShareHelperModel alloc]  init];
//    shareModel.title = @"分享标题";
//    shareModel.content = @"分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容";
//    shareModel.url = @"https://developer.umeng.com/docs/66632/detail/66825#h3-u65B0u6D6Au5FAEu535A";
//
//
//    [[SocialShareHelper defaultShareHelper]  shareMode:shareModel toSharePlatform:SSTUMShareToQQ showInController:self successBlock:^{
//
//    } failureBlock:^(NSString *errorMsg) {
//
//    }];
}
- (IBAction)shareBySina:(id)sender {
//    ShareHelperModel *shareModel = [[ShareHelperModel alloc]  init];
//    shareModel.title = @"分享标题";
//    shareModel.content = @"分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容";
//    shareModel.url = @"https://developer.umeng.com/docs/66632/detail/66825#h3-u65B0u6D6Au5FAEu535A";
//
//
//    [[SocialShareHelper defaultShareHelper]  shareMode:shareModel toSharePlatform:SSTUMShareToSina showInController:self successBlock:^{
//
//    } failureBlock:^(NSString *errorMsg) {
//
//    }];
}
- (IBAction)shareByEmail:(id)sender {
//    ShareHelperModel *shareModel = [[ShareHelperModel alloc]  init];
//    shareModel.title = @"分享标题";
//    shareModel.content = @"分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容";
//    shareModel.url = @"https://developer.umeng.com/docs/66632/detail/66825#h3-u65B0u6D6Au5FAEu535A";
//    
//    
//    [[SocialShareHelper defaultShareHelper]  shareMode:shareModel toSharePlatform:SSTUMShareToEmail showInController:self successBlock:^{
//        
//    } failureBlock:^(NSString *errorMsg) {
//        
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
