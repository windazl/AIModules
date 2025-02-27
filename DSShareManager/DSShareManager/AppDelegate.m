//
//  AppDelegate.m
//  DSShareManager
//
//  Created by ai on 2017/9/26.
//  Copyright © 2017年 ai. All rights reserved.
//

#import "AppDelegate.h"
#import "DSShareManager.h"
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "WeiboSDK.h"

static NSString *const kTencent = @"";
static NSString *const kWX = @"";
static NSString *const kWeibo = @"";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [WXApi registerApp:kWX];
    [WeiboSDK registerApp:kWeibo];
    [[TencentOAuth alloc] initWithAppId:kTencent andDelegate:nil];
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

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url  {
    if ([[url absoluteString] hasPrefix:[NSString stringWithFormat:@"wx%@://",kWX]]) {
        return [WXApi handleOpenURL:url delegate:nil];
        
    } else if([[url absoluteString] hasPrefix:[NSString stringWithFormat:@"wb%@://",kWeibo]]) {
        return [WeiboSDK handleOpenURL:url delegate:nil];
        
    } else if([[url absoluteString] hasPrefix:[NSString stringWithFormat:@"tencent%@://",kTencent]]) {
        return [QQApiInterface handleOpenURL:url delegate:nil];

    } else {
        return YES;
    }
}



- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation {
    if ([[url absoluteString] hasPrefix:[NSString stringWithFormat:@"wx%@://",kWX]]) {
        return [WXApi handleOpenURL:url delegate:nil];
        
    } else if([[url absoluteString] hasPrefix:[NSString stringWithFormat:@"wb%@://",kWeibo]]) {
        return [WeiboSDK handleOpenURL:url delegate:nil];
        
    } else if([[url absoluteString] hasPrefix:[NSString stringWithFormat:@"tencent%@://",kTencent]]) {
        return [QQApiInterface handleOpenURL:url delegate:nil];
        
    } else {
        return YES;
    }
}
@end
