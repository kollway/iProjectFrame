//
//  KWMFirstController.m
//  iProjectFrame
//
//  Created by Yaotian on 12/17/13.
//  Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import "KWMFirstController.h"
#import "KWMMenuController.h"

@interface KWMFirstController ()

@end

@implementation KWMFirstController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
