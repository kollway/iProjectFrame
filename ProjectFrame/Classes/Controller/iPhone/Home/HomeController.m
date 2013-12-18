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
        // Custom initialization}
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadTabBar];
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
    settingsController.title = @"Settings 1";
    NavigationController* navSettingsController = [[[NavigationController alloc] initWithRootViewController:settingsController] autorelease];
    
    SettingsController* settingsController2 = [[[SettingsController alloc] initWithNibName:@"SettingsController" bundle:nil] autorelease]; 
    settingsController2.title = @"Settings 2";
    NavigationController* navSettingsController2 = [[[NavigationController alloc] initWithRootViewController:settingsController2] autorelease];
    
    SettingsController* settingsController3 = [[[SettingsController alloc] initWithNibName:@"SettingsController" bundle:nil] autorelease];
    settingsController3.title = @"Settings 3";
    NavigationController* navSettingsController3 = [[[NavigationController alloc] initWithRootViewController:settingsController3] autorelease];
    
    SettingsController *settingsController4 = [[[SettingsController alloc]initWithNibName:@"SettingsController" bundle:nil] autorelease];
    settingsController4.title = @"Settings 4";
    NavigationController *navSettingController4 = [[[NavigationController alloc]
                                                    initWithRootViewController:settingsController4] autorelease];
    
    
    self.viewControllers=[NSArray arrayWithObjects:navSettingsController, navSettingsController2,navSettingsController3,navSettingController4, nil];
    
    [pool drain];
}

@end
