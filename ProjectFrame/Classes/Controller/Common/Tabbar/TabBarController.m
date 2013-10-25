//
//  TabBarController.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "TabBarController.h"
#import "TabBarItem.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
        

	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
	self.view.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
	self.view.autoresizesSubviews = YES;
    
    if (IOS7) {
        self.view.bounds = CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height );
    }

    
    
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)setViewControllers:(NSArray *)array {
	[super setViewControllers:array];
	// self.selectedIndex=0;
	for (UIView *view in self.view.subviews) {
		if ([view isKindOfClass:[UITabBar class]]) {
			bgView = [[UIImageView alloc] initWithImage:image(@"bg_tab.png")];
			bgView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
			bgView.userInteractionEnabled = YES;
            
			CGRect frame = view.frame;
			frame.origin.y = frame.origin.y - 20;
			bgView.frame = frame;
			[self.view addSubview:bgView];
			[bgView release];
			view.hidden = YES;
            
			selectedFilterImage = [[UIImageView alloc] initWithImage:image(@"bg_tab_on.png")];
			[bgView addSubview:selectedFilterImage];
			[selectedFilterImage release];
            
            
			[self setTabBar];
            
			[self adjustFilterImage];
            
			break;
		}
	}
}

- (void)setTabBar {
	float x = 0;
	float w = bgView.frame.size.width / [self.viewControllers count];
	float h = bgView.frame.size.height;
	CGRect rect;
	for (UIViewController *viewController in self.viewControllers) {
		if ([viewController isKindOfClass:[UINavigationController class]]) {
			viewController = ((UINavigationController *)viewController).topViewController;
		}
		if (viewController == nil) continue;
        
		UITabBarItem *tabbar = viewController.tabBarItem;
		UIImageView *imageView = nil;
		UILabel *label = nil;
		//        float labelHeight=0.0f;
		if (tabbar.image != nil) {
			imageView = [[UIImageView alloc] initWithImage:tabbar.image];
            
			imageView.userInteractionEnabled = YES;
			[bgView addSubview:imageView];
			[imageView release];
			if ([tabbar isKindOfClass:[TabBarItem class]]) {
				TabBarItem *tabbarNewItem = (TabBarItem *)tabbar;
				if (tabbarNewItem.selectedImage != nil) {
					imageView.highlightedImage = tabbarNewItem.selectedImage;
				}
			}
		}
		if ([tabbar.title length] > 0 || [viewController.title length] > 0) {
			label = [[UILabel alloc] init];
			[bgView addSubview:label];
			if ([tabbar.title length] > 0)
				label.text = tabbar.title;
			else
				label.text = viewController.title;
			label.numberOfLines = 1;
			[label setTheme:@"tabbar_label"];
			label.textAlignment = UITextAlignmentCenter;
			[label sizeToFit];
            
			[label release];
		}
        
		rect = imageView.frame;
		rect.origin.x = x + (w - rect.size.width) * 0.5f;
		rect.origin.y = 6.0f;
		imageView.frame = rect;
        
		rect = label.frame;
		rect.size.width = w - 6;
		rect.origin.x = x + (w - rect.size.width) * 0.5f;
		rect.origin.y = h - rect.size.height - 1.0f;
		label.frame = rect;
        
		x += w;
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView:bgView];
	float x = 0;
	float w = bgView.frame.size.width / [self.viewControllers count];
	float h = bgView.frame.size.height;
	lastestSelectedIndex = self.selectedIndex;
	for (int i = 0; i < [self.viewControllers count]; i++) {
		if (CGRectContainsPoint(CGRectMake(x, 0, w, h), point)) {
			[self.selectedViewController viewDidDisappear:NO];
            
			self.selectedIndex = i;
			if ([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
				[self.delegate tabBarController:self didSelectViewController:self.selectedViewController];
			}
			[self.selectedViewController viewDidAppear:NO];
            
			break;
		}
		x += w;
	}
}

- (void)adjustFilterImage {
	int index = 0;
	int selectedIndex = self.selectedIndex;
    
	float x = 0;
	float w = bgView.frame.size.width / [self.viewControllers count];
    
    
	for (UIView *view in bgView.subviews) {
		if ([view isKindOfClass:[UIImageView class]]) {
			UIImageView *imageView = (UIImageView *)view;
			imageView.highlighted = (index == selectedIndex);
            
			if (index == selectedIndex) {
				CGRect rect = selectedFilterImage.frame;
				rect.origin.x = x;
				rect.origin.y = 0;
				rect.size.width = w;
				rect.size.height = bgView.frame.size.height;
				//[UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
				selectedFilterImage.frame = rect;
                
				//} completion:^(BOOL finish){
				//}];
			}
		}
		else if ([view isKindOfClass:[UILabel class]]) {
			UILabel *label = (UILabel *)view;
			label.highlighted = (index == selectedIndex);
			index++;
			x += w;
		}
	}
}

- (void)setSelectedIndex:(NSUInteger)value {
	[super setSelectedIndex:value];
	[self adjustFilterImage];
}

//-(void)delayAdjuse{
//    for(UIView *view in self.view.subviews){
//		if([view isKindOfClass:[UITabBar class]]){
//            bgView.frame=view.frame;
//			break;
//		}
//	}
//}
//
//-(void)setFrame:(CGRect)frame{
//    self.view.frame=frame;
//    [self performSelector:@selector(delayAdjuse) withObject:nil afterDelay:0.01f];
//}

@end
