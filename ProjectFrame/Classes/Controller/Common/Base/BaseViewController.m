//
//  BaseViewController.m
//  MyFrame
//
//  Created by Sean on 13-9-1.
//
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    
    if(IOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSkin {
    
}

- (void)onThemeChanged {
    
}

- (void)onLanguageChanged {
    
}

@end
