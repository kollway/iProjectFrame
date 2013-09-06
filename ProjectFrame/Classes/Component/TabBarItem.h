//
//  TabBarItem.h
//  ProjectFrame
//
//  Created by Sean on 13-9-5.
//
//

#import <UIKit/UIKit.h>

@interface TabBarItem : UITabBarItem {
	UIImage *selectedImage;
}

- (id)initWithTitle:(NSString *)title image:(NSString *)imageName1 selectedImage:(NSString *)imageName2;
- (id)initWithTitle:(NSString *)title;


@property (nonatomic, retain) UIImage *selectedImage;

@end
