//
//  Log.m
//  MyFrame
//
//  Created by sean zheng on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LogUtil.h"

static LOG_LEVEL log_level = LOG_DEBUG;

@implementation LogUtil

+(void)logWithTag:(NSString *)tag withFormat:(NSString *)format, ...{
    NSString *logString = [[NSString alloc] initWithFormat:@"{%@} %@", tag, format];
    va_list args;
    va_start(args, format);
    //print log
    NSLogv(logString, args);
    va_end(args);
    [logString release];
}

+(void)errorWithTag:(NSString *)tag withFormat:(NSString *)format, ... {
    if(log_level >= LOG_ERROR) {
        NSString *logString = [[NSString alloc] initWithFormat:@"[%@] %@", tag, format];
        va_list args;
        va_start(args, format);
        //print log
        NSLogv(logString, args);
        va_end(args);
        [logString release];
    }
}

+(void)warmWithTag:(NSString *)tag withFormat:(NSString *)format, ... {
    if(log_level >= LOG_WARM) {
        NSString *logString = [[NSString alloc] initWithFormat:@"[%@] %@", tag, format];
        va_list args;
        va_start(args, format);
        //print log
        NSLogv(logString, args);
        va_end(args);
        [logString release];
    }
}

+(void)infoWithTag:(NSString *)tag string:(NSString *)format, ... {
    if(log_level >= LOG_INFO) {
        NSString *logString = [[NSString alloc] initWithFormat:@"[%@] %@", tag, format];
        va_list args;
        va_start(args, format);
        //print log
        NSLogv(logString, args);
        va_end(args);
        [logString release];
    }
}

+(void)debugWithTag:(NSString *)tag string:(NSString *)format, ... {
    if(log_level >= LOG_DEBUG) {
        NSString *logString = [[NSString alloc] initWithFormat:@"[%@] %@", tag, format];
        va_list args;
        va_start(args, format);
        //print log
        NSLogv(logString, args);
        va_end(args);
        [logString release];
    }
}

+(void)verboseWithTag:(NSString *)tag string:(NSString *)format, ... {
    if(log_level >= LOG_VERBOSE) {
        NSString *logString = [[NSString alloc] initWithFormat:@"[%@] %@", tag, format];
        va_list args;
        va_start(args, format);
        //print log
        NSLogv(logString, args);
        va_end(args);
        [logString release];
    }
}

@end
