//
//  Log.h
//  MyFrame
//
//  Created by Sean Zheng on 3/8/12.
//  Copyright (c) 2012 Kollway. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum LOG_LEVEL {
    LOG_ERROR = 0,
    LOG_WARM = 1,
    LOG_INFO = 2,
    LOG_DEBUG = 3,
    LOG_VERBOSE = 4
} LOG_LEVEL;

@interface Log : NSObject

+(void)e:(NSString *)tag string:(NSString *)format, ...;

+(void)w:(NSString *)tag string:(NSString *)format, ...;

+(void)i:(NSString *)tag string:(NSString *)format, ...;

+(void)d:(NSString *)tag string:(NSString *)format, ...;

+(void)v:(NSString *)tag string:(NSString *)format, ...;

@end
