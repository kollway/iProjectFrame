//
//  Constant.h
//  ProjectFrame
//
//  Created by Sean Zheng on 3/8/12.
//  Copyright (c) 2012 Kollway. All rights reserved.
//

#ifndef MyFrame_Constant_h
#define MyFrame_Constant_h

/** --------------------------Define Constance Method-------------------------- */
//#define lang(key) NSLocalizedStringFromTable(key, [APPUtil language], @"")

/** ------------------------Define AppDelegate & Controller--------------------- */
#define APP_DELEGATE (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define ROOT_CONTROLLER (RootController *)[APP_DELEGATE rootController]

/** ----------------------------Define Managers---------------------------------- */
#define SETTINGS_MANAGER (SettingsManager *)[SettingsManager sharedInstance]
#define API_MANAGER (APIManager *)[APIManager sharedInstance]
#define DATABASE_MANAGER (DatabaseManager *)[DatabaseManager sharedInstance]
#define THEME_MANAGER (ThemeManager *)[ThemeManager sharedInstance]


/** --------------------------Define Notification-------------------------------- */


#endif
