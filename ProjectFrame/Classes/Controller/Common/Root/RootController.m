//
//  RootController.m
//  MyFrame
//
//  Created by Sean on 13-9-1.
//
//

#import "RootController.h"
#import "AppDelegate.h"

@interface RootController ()

@end

@implementation RootController

@synthesize homeController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    
    
    homeController = [[HomeController alloc] init];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    homeController.view.frame = frame;
    homeController.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:homeController.view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
//    UIButton *btn = [[UIButton alloc] init];
//    btn.frame = self.view.frame;
//    btn.backgroundColor = [UIColor redColor];
//    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    self.homeController = nil;
    [super dealloc];
}

@end
