//
//  MayAppDelegate.m
//  Maystall
//
//  Created by ss4346 on 13-10-28.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "MayAppDelegate.h"
#import "MayColorValue.h"
#import "CheckNetwork.h"
#import "Config.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation MayAppDelegate

@synthesize window;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    navigationController.delegate = self;
    
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
        view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_home_nav"]];
        [self.window.rootViewController.view addSubview:view];
    }
    
    [self.window makeKeyAndVisible];
    
    [Config Instance].isLogin = YES;

    if ([Config Instance].isLogin) {
        NSLog(@"is Login");
    }else{
        NSLog(@"not login");
    }
    
    //检查网络是否存在 如果不存在 则弹出提示
    [Config Instance].isNetworkRunning = [CheckNetwork isExistenceNetwork];
   
    
    //设置uitabbar 背景，文字颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_home_tab"]];
    [[UITabBar appearance] setSelectionIndicatorImage:nil];
    [UITabBarItem.appearance setTitleTextAttributes:@{ UITextAttributeTextColor : TAB_COLOR_DARK } forState:UIControlStateNormal];
    [UITabBarItem.appearance setTitleTextAttributes:@{ UITextAttributeTextColor : TAB_COLOR_LIGHT} forState:UIControlStateSelected];
    
    
    return YES;
}

- (void)navigationController:(UINavigationController *)navController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if ([viewController respondsToSelector:@selector(willAppearIn:)])
//        [viewController performSelector:@selector(willAppearIn:) withObject:navController];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
