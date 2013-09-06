//
//  Button.m
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "Button.h"
#import "ThemeManager.h"

@implementation Button

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
        [self setTheme:@"btn_normal"];
//		[self setBackgroundImage:image(@"btn_normal.png") forState:UIControlStateNormal];
//		[self setBackgroundImage:image(@"btn_press.png") forState:UIControlStateHighlighted];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		// Initialization code
//		[self setBackgroundImage:image(@"btn_normal.png") forState:UIControlStateNormal];
//		[self setBackgroundImage:image(@"btn_press.png") forState:UIControlStateHighlighted];
        [self setTheme:@"btn_normal"];
	}
	return self;
}

- (void)setTheme:(NSString *)key {
	Theme *theme = [THEME_MANAGER get:key];
	if (theme != nil) {
		if (theme.backgroundColor != nil) {
			[self setBackgroundColor:theme.backgroundColor];
		}
		if (theme.textColor != nil) {
			[self setTitleColor:theme.textColor forState:UIControlStateNormal];
		}
		if (theme.highlightColor != nil) {
			[self setTitleColor:theme.highlightColor forState:UIControlStateHighlighted];
		}
		if (theme.disabledColor != nil) {
			[self setTitleColor:theme.disabledColor forState:UIControlStateDisabled];
		}
        
        if (theme.backgroundImage != nil) {
			[self setBackgroundImage:image(theme.backgroundImage) forState:UIControlStateNormal];
		}
		if (theme.highlightImage != nil) {
			[self setBackgroundImage:image(theme.highlightImage) forState:UIControlStateHighlighted];
		}
        
		if (theme.fontSize > 0) {
			self.titleLabel.font = [theme font];
		}
	}
}

@end
