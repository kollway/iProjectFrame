//
// Created by Yaotian on 12/18/13.
// Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import <ECSlidingViewController/ECSlidingViewController.h>
#import "KWMBaseController.h"
#import "KWMMenuController.h"


@implementation KWMBaseController {

}

- (IBAction)revealMenu:(id)sender {

    NSLog(@"title:%@", [sender title]);
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController
          isKindOfClass:[KWMMenuController class]]) {
        self.slidingViewController.underLeftViewController =
        [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

@end