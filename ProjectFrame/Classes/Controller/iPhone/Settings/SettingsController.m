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
#import "TabBarItem.h"

@interface SettingsController ()

@end

@implementation SettingsController

@synthesize btnDetail;
@synthesize btnLogin;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem=[[[TabBarItem alloc] initWithTitle:@"Settings" image:@"icon_pulse_off.png" selectedImage:@"icon_pulse_on.png"] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [btnDetail setTheme:@"btn_normal"];
    [btnLogin setTheme:@"btn_normal"];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 64.0f, 30.0f)];
    [backButton setTitle:@"Title:Normal" forState:UIControlStateNormal];
    [backButton setTheme:@"btn_normal"];
    [backButton addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void) popVC{
    [self.navigationController popViewControllerAnimated:YES];
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
    self.btnLogin = nil;
    self.btnDetail = nil;
    [super dealloc];    
}

@end
