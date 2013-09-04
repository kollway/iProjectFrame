//
//  AppDelegate.h
//  MyFrame
//
//  Created by Sean Zheng on 3/8/12.
//  Copyright (c) 2012 Kollway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootController.h"
#import "SettingsManager.h"
#import "DatabaseManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) RootController *rootController;


@end
