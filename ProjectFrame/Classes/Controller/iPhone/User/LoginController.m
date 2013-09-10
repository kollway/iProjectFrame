//
//  LoginController.m
//  ProjectFrame
//
//  Created by Sean on 13-9-4.
//
//

#import "LoginController.h"
#import "RootController.h"

@interface LoginController ()

@end

@implementation LoginController

@synthesize btnCancel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Login";
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

- (IBAction)onBtnCancelClick:(id)sender {
    [ROOT_CONTROLLER dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    self.btnCancel = nil;
    [super dealloc];
}

@end
