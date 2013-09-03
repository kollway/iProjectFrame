//
//  DatabaseManager.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "DatabaseManager.h"

@implementation DatabaseManager

static DatabaseManager *instance = nil;

+ (DatabaseManager *)sharedInstance {
    if(instance == nil) {
        instance = [[DatabaseManager alloc] init];
    }
    return instance;
}

@end
