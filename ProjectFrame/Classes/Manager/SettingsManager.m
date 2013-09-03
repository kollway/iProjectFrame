//
//  SettingManager.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "SettingsManager.h"
#import "AppDelegate.h"

@implementation SettingsManager

static SettingsManager *instance = nil;

+ (SettingsManager *)sharedInstance {
    if(instance == nil) {
        instance = [[SettingsManager alloc] init];
    }
    return instance;
}

- (id)initWithAppDelegate: (AppDelegate *)delegate {
    self = [super init];
    return self;
}

- (int)getVersionNum {
    return 1;
}

@end
