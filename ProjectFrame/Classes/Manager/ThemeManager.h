//
//  ThemeManager.h
//  ProjectFrame
//
//  Created by Sean on 13-9-4.
//
//

#import <Foundation/Foundation.h>

/*!
 @class Theme
 @abstract the model of about the theme
 */
@interface Theme:NSObject

@property(nonatomic,retain) NSString* key;
@property(nonatomic,retain) UIColor* textColor;
@property(nonatomic,retain) UIColor* highlightColor;
@property(nonatomic,retain) UIColor* disabledColor;
@property(nonatomic,retain) UIColor* backgroundColor;
@property(nonatomic,assign) float fontSize;
@property(nonatomic,assign) BOOL  fontBold;
@property(nonatomic,retain) NSString* fontName;
@property(nonatomic,retain) NSString* backgroundImage;
@property(nonatomic,retain) NSString* highlightImage;

-(UIFont*)font;

@end

/*!
 @class ThemeManager
 @abstract the manager of about the theme
 */
@interface ThemeManager : NSObject{
    NSMutableArray* themeList;
    
    NSMutableArray* themeImageList;
    
    NSString* themePath;
}


@property(nonatomic,retain) UIColor* patternBgColor;


/*
 @return the shared instance
 */
+ (ThemeManager *)sharedInstance;

/*
 @return UIImage from image name   use [UIImage imageNamed:]
 */
- (UIImage *)imageByTheme:(NSString *)imageName;

/*
 @return UIImage from image name  usr [UIImage imageWithContentsOfFile:];
 */
- (UIImage *)imageResourceByTheme:(NSString *)imageName;

/*
 @open the theme xml  and category xml to parser
 */
- (void)open:(THEME)theme;

/*
 @open the theme xml and parser
 */
- (void)openTheme:(NSString *)file;


/*
 @return theme object from key
 */
- (Theme *)get:(NSString*)key;


@end