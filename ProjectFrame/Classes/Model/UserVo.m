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
    self.userName = nil;
    self.password = nil;
    [super dealloc];    
}

@end
