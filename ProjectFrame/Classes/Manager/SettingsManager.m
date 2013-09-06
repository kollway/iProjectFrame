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

@synthesize language;
@synthesize theme;

static SettingsManager *instance = nil;

+ (SettingsManager *)sharedInstance {
    if(instance == nil) {
        instance = [[SettingsManager alloc] init];
    }
    return instance;
}

- (id)init {
    self = [super init];
    if(self) {
        self.theme = THEME_NORMAL;
        self.language = LANGUAGE_SC;
    }
    return self;
}

- (int)getVersionNum {
    return 1;
}

@end
