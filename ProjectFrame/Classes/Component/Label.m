
//
//  Created by Sean Zheng on 13-09-05.
//  Copyright (c) 2013 Kollway. All rights reserved.
//

#import "Label.h"

@implementation Label

- (void)setTheme:(NSString *)key {
	Theme *theme = [THEME_MANAGER get:key];
	if (theme != nil) {
		if (theme.backgroundColor != nil)
			self.backgroundColor = theme.backgroundColor;
		else
			self.backgroundColor = [UIColor clearColor];
		if (theme.textColor != nil)
			self.textColor = theme.textColor;
		if (theme.highlightColor != nil)
			self.highlightedTextColor = theme.highlightColor;
		if (theme.fontSize > 0)
			self.font = [theme font];
	}
}

@end
