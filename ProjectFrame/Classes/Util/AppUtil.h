//
//  AppUtil.h
//  MyFrame
//
//  Created by Sean Zheng on 3/8/12.
//  Copyright (c) 2012 Kollway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtil : NSObject

+ (NSString *)language;
+ (BOOL)isRetain4;
+ (NSString*)getAppName;
+ (NSString*)trim:(NSString *)value;

+ (BOOL)isValidateEmail:(NSString *)email;

+ (NSString *)stringFromMD5:(NSString *)key;

+ (NSString *)macAddress;

+ (NSString *)uuid;

+ (BOOL)hasInternetConnectionStatus;

+ (UIColor *)colorConvertFromString:(NSString *)value;

@end
