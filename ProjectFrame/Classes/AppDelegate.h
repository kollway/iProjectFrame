//
//  AppDelegate.h
//  MyFrame
//
//  Created by sean zheng on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "SettingsManager.h"
#import "DatabaseManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

@property (assign, nonatomic) SettingsManager *settingsManager;
@property (assign, nonatomic) DatabaseManager *databaseManager;

@property (retain, nonatomic) RootViewController *rootController;


@end
