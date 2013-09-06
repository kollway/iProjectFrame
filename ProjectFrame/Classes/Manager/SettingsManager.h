//
//  SettingManager.h
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import <Foundation/Foundation.h>

@interface SettingsManager : NSObject

@property THEME theme;
@property LANGUAGE language;

+ (SettingsManager *)sharedInstance;

- (int)getVersionNum;


@end
