//
//  AppDelegate.m
//  MGSocialShareDemo
//
//  Created by Hosea Lee on 2018/4/17.
//  Copyright © 2018年 Hosea Lee. All rights reserved.
//

#import "AppDelegate.h"
#import <MGSocialShareKit/MGSocialShareKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [MGSocialShareHelper configWithUMAppKey:@"5a337f9ba40fa3606c000102" umSocialAppSecret:@"" openLog:YES usingHttpsWhenShareContent:NO];
    
    [MGSocialShareHelper configSharePlateform:MGShareToWechatSession withAppKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
    
    [MGSocialShareHelper configSharePlateform:MGShareToQQ withAppKey:@"1105821097" appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];

    [MGSocialShareHelper configSharePlateform:MGShareToSina withAppKey:@"3921700954" appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];

    [MGSocialShareHelper configSharePlateform:MGShareToDingDing withAppKey:@"dingoalmlnohc0wggfedpk" appSecret:nil redirectURL:nil];
    
    [MGSocialShareHelper configSharePlateform:MGShareToAlipay withAppKey:@"2015111700822536" appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];

    
    [MGSocialShareHelper configSharePlateform:MGShareToYixinSession withAppKey:@"yx35664bdff4db42c2b7be1e29390c1a06" appSecret:nil redirectURL:nil];

    
    
    [MGSocialShareHelper configSharePlateform:MGShareToLaiWangSession withAppKey:@"8112117817424282305" appSecret:@"9996ed5039e641658de7b83345fee6c9" redirectURL:@"http://mobile.umeng.com/social"];

    [MGSocialShareHelper configSharePlateform:MGShareToLinkedin withAppKey:@"81t5eiem37d2sc" appSecret:@"7dgUXPLH8kA8WHMV" redirectURL:@"https://api.linkedin.com/v1/people"];


    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [MGSocialShareHelper mg_handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [MGSocialShareHelper mg_handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [MGSocialShareHelper  mg_handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}
@end
