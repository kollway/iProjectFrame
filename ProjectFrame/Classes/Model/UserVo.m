//
//  UserVo.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "UserVo.h"


@implementation UserVo

@synthesize userName;
@synthesize password;

- (void)dealloc {
    [super dealloc];
    
    self.userName = nil;
    self.password = nil;
}

@end
