//
//  TabBarItem.m
//  ProjectFrame
//
//  Created by Sean on 13-9-5.
//
//

#import "TabBarItem.h"

@implementation TabBarItem
@synthesize selectedImage;

- (id)initWithTitle:(NSString *)title image:(NSString *)imageName1 selectedImage:(NSString *)imageName2 {
	self = [super initWithTitle:title image:[THEME_MANAGER imageByTheme:imageName1] tag:0];
	self.selectedImage = [THEME_MANAGER imageByTheme:imageName2];
	return self;
}

- (id)initWithTitle:(NSString *)title {
	self = [super initWithTitle:title image:nil tag:0];
	return self;
}

- (void)dealloc {
	self.selectedImage = nil;
	[super dealloc];
}

@end
