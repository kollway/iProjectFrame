//
//  KWMHomeController.m
//  iProjectFrame
//
//  Created by Yaotian on 12/17/13.
//  Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import "KWMHomeController.h"

@interface KWMHomeController ()

@end

@implementation KWMHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.shouldAdjustChildViewHeightForStatusBar = YES;
        self.statusBarBackgroundView.backgroundColor = [UIColor blackColor];
    }
    
    self.topViewController = [self.storyboard
                              instantiateViewControllerWithIdentifier:@"First"];
    self.shouldAddPanGestureRecognizerToTopViewSnapshot = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
