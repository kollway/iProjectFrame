//
//  HomeController.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "HomeController.h"
#import "NavigationController.h"
#import "SettingsController.h"
#import "MenuController.h"

@interface HomeController ()

@end

@implementation HomeController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadTabBar{
    
    NSAutoreleasePool* pool=[NSAutoreleasePool new];
    
    SettingsController* settingsController = [[[SettingsController alloc] initWithNibName:@"SettingsController" bundle:nil] autorelease];
    NavigationController* navSettingsController = [[[NavigationController alloc] initWithRootController:settingsController] autorelease];
    
    SettingsController* settingsController2 = [[[SettingsController alloc] initWithNibName:@"SettingsController" bundle:nil] autorelease];
    NavigationController* navSettingsController2 = [[[NavigationController alloc] initWithRootController:settingsController] autorelease];
    
    SettingsController* settingsController3 = [[[SettingsController alloc] initWithNibName:@"SettingsController" bundle:nil] autorelease];
    NavigationController* navSettingsController3 = [[[NavigationController alloc] initWithRootController:settingsController] autorelease];
    
    
    self.viewControllers=[NSArray arrayWithObjects:navSettingsController, navSettingsController2,navSettingsController3, nil];
    
    [pool drain];
}

@end
