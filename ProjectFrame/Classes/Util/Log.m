//
//  Log.m
//  MyFrame
//
//  Created by Sean Zheng on 3/8/12.
//  Copyright (c) 2012 Kollway. All rights reserved.
//

#import "Log.h"

static LOG_LEVEL log_level = LOG_DEBUG;

@implementation Log

+(void)logWithTag:(NSString *)tag withFormat:(NSString *)format, ...{
    NSString *logString = [[NSString alloc] initWithFormat:@"{%@} %@", tag, format];
    va_list args;
    va_start(args, format);
    //print log
    NSLogv(logString, args);
    va_end(args);
    [logString release];
}

+(void)e:(NSString *)tag string:(NSString *)format, ... {
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

+(void)w:(NSString *)tag string:(NSString *)format, ... {
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

+(void)i:(NSString *)tag string:(NSString *)format, ... {
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

+(void)d:(NSString *)tag string:(NSString *)format, ... {
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

+(void)v:(NSString *)tag string:(NSString *)format, ... {
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
