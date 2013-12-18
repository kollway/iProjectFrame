//
// Created by Yaotian on 12/18/13.
// Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import <ECSlidingViewController/ECSlidingViewController.h>
#import "KWMBaseController.h"


@implementation KWMBaseController {

}

- (IBAction)revealMenu:(id)sender {

    NSLog(@"title:%@", [sender title]);
    [self.slidingViewController anchorTopViewTo:ECRight];
}

@end