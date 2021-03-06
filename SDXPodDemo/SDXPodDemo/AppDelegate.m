//
//  AppDelegate.m
//  SDXPodDemo
//
//  Created by admin on 2019/3/28.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "YPSDK/YPSDX.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#ifdef DEBUG
    [YPSDX startSDKDebugMode];
#else
    [YPSDX startSDK];
#endif
    
    //初始化rootVC（rootVC为navC的根视图控制器，也就是首个被navC管理的视图控制器）
    ViewController *rootVC = [[ViewController alloc] init]; //自定义一个RootViewController类
    
    //初始化navC 初始化方法使用的是可以给navC设置根视图控制器的方法
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    
    //将navC设置为window设置根视图控制器
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:navC];
    [self.window makeKeyAndVisible];
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


@end
