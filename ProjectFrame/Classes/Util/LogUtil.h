//
//  Log.h
//  MyFrame
//
//  Created by sean zheng on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum LOG_LEVEL {
    LOG_ERROR = 0,
    LOG_WARM = 1,
    LOG_INFO = 2,
    LOG_DEBUG = 3,
    LOG_VERBOSE = 4
} LOG_LEVEL;

@interface LogUtil : NSObject

+(void)errorWithTag:(NSString *)tag withFormat:(NSString *)format, ...;

+(void)warmWithTag:(NSString *)tag withFormat:(NSString *)format, ...;

+(void)infoWithTag:(NSString *)tag string:(NSString *)format, ...;

+(void)debugWithTag:(NSString *)tag string:(NSString *)format, ...;

+(void)verboseWithTag:(NSString *)tag string:(NSString *)format, ...;

@end
