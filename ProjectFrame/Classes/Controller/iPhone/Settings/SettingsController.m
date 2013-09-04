//
//  SettingsController.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "SettingsController.h"
#import "SettingsDetailController.h"
#import "RootController.h"
#import "LoginController.h"
#import "AppDelegate.h"
#import "NavigationController.h"

@interface SettingsController ()

@end

@implementation SettingsController

@synthesize btnDetail;
@synthesize btnLogin;

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


- (IBAction)onBtnDetailClick:(id)sender {
    SettingsDetailController *detailController = [[SettingsDetailController alloc] init];
    [self.navigationController pushViewController:detailController animated:YES];
    [detailController release];
}

- (IBAction)onBtnLoginClick:(id)sender {
    LoginController *loginController = [[LoginController alloc] init];
    NavigationController *navController = [[NavigationController alloc] initWithRootViewController:loginController];
    [ROOT_CONTROLLER presentModalViewController:navController animated:YES];
    [loginController release];
    [navController release];
}

- (void)dealloc {
    [super dealloc];
    
    self.btnLogin = nil;
    self.btnDetail = nil;
}

@end
