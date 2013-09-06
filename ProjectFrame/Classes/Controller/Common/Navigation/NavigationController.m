//
//  NavigationController.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "NavigationController.h"
#import "ThemeManager.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.delegate = self;
		[self updateSkin];
	}
	return self;
}

- (id)initWithRootViewController:(UIViewController *)viewController {
	self = [super initWithRootViewController:viewController];
	if (self) {
		self.delegate = self;
		[self updateSkin];
	}
	return self;
}

- (id)init {
	self = [super init];
	if (self) {
		self.delegate = self;
		[self updateSkin];
	}
	return self;
}

- (void)updateSkin {
    //    @"bg_top.png"
	UIImage *image = image(@"bg_top.png");
	if ([[[UIDevice currentDevice] systemVersion] floatValue] < 5.0) {   //ios 5 以下
        //        backgroundImage.image=image;
		UIImageView *bgImage = [[[UIImageView alloc] initWithImage:image] autorelease];
		[self.navigationBar sendSubviewToBack:bgImage];
	}
	else {
		[self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
	}
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
