//
//  APIManager.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "APIManager.h"

@implementation APIManager

static APIManager *instance = nil;

+ (APIManager *)sharedInstance {
    if(instance == nil) {
        instance = [[APIManager alloc] init];
    }
    return instance;
}

@end
