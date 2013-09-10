//
//  AppDelegate.m
//  MyFrame
//
//  Created by Sean Zheng on 3/8/12.
//  Copyright (c) 2012 Kollway. All rights reserved.
//

#import "AppDelegate.h"
#import "SettingsManager.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize rootController = _rootController;

static NSString *const TAG = @"AppDelegate";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self initManager];
    
	_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	// Override point for customization after application launch.
	_rootController = [[RootController alloc] init];
	_rootController.view.frame = self.window.frame;
	_rootController.view.backgroundColor = [UIColor yellowColor];
	self.window.rootViewController = _rootController;
	[self.window makeKeyAndVisible];
    
    
	[Log i:TAG string:@"didFinishLaunchingWithOptions"];
    
//    [Log i:TAG string:@"test >> %d", test];
    
	return YES;
}

- (void)initManager {
	[Log i:TAG string:@"initManager"];
	[THEME_MANAGER open:[SETTINGS_MANAGER theme]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
	/*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
	[Log i:TAG string:@"applicationWillResignActive"];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	/*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
	[Log i:TAG string:@"applicationDidEnterBackground"];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	/*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
	[Log i:TAG string:@"applicationWillEnterForeground"];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	/*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
	[Log i:TAG string:@"applicationDidBecomeActive"];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	/*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
	 */
	[Log i:TAG string:@"applicationWillTerminate"];
}

- (void)dealloc {
	[super dealloc];
    
	self.rootController = nil;
}

@end
