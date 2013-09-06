//
//  ThemeManager.m
//  ProjectFrame
//
//  Created by Sean on 13-9-4.
//
//

#import "ThemeManager.h"

#import "GDataXMLNode.h"

static ThemeManager *instance = nil;

@interface ThemeImage : NSObject

@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) UIImage *image;

@end

@implementation ThemeImage

@synthesize key;
@synthesize image;
- (void)dealloc {
	self.key = nil;
	self.image = nil;
	[super dealloc];
}

@end


@implementation Theme

@synthesize key;
@synthesize textColor;
@synthesize  highlightColor;
@synthesize disabledColor;

@synthesize backgroundColor;
@synthesize fontSize;
@synthesize  fontBold;
@synthesize fontName;

@synthesize backgroundImage;
@synthesize highlightImage;

- (id)init {
	self = [super init];
    
	return self;
}

- (void)dealloc {
	self.key = nil;
	self.textColor = nil;
	self.highlightColor = nil;
	self.disabledColor = nil;
	self.backgroundColor = nil;
	self.fontName = nil;
    self.backgroundImage = nil;
    self.highlightImage = nil;
	[super dealloc];
}

- (UIFont *)font {
	if (self.fontName != nil) {
		return [UIFont fontWithName:self.fontName size:fontSize];
	}
	else {
		if (fontBold)
			return [UIFont boldSystemFontOfSize:fontSize];
		else
			return [UIFont systemFontOfSize:fontSize];
	}
}

@end

@implementation ThemeManager

@synthesize patternBgColor;

static NSString * const TAG = @"ThemeManager";

+ (ThemeManager *)sharedInstance {
	if (instance == nil)
		instance = [[ThemeManager alloc] init];
	return instance;
}

- (UIImage *)imageByTheme:(NSString *)nameKey {
    //    if([nameKey length]<1)return nil;
    //    for(ThemeImage* image in themeImageList){
    //        if([image.key isEqualToString:nameKey])
    //            return image.image;
    //    }
    //    ThemeImage* t=[[ThemeImage alloc] init];
    //    t.key=nameKey;
    //    if(DefaultTheme(themeKey)){
    //        t.image=[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:nameKey ofType:nil]];
    //    }
    //    else{
    //        t.image=[UIImage imageWithContentsOfFile:[themePath stringByAppendingPathComponent:[NSString stringWithFormat:@"images/%@",nameKey]]];
    //    }
    //    [themeImageList addObject:t];
    //    [t release];
    //    return t.image;
	return [UIImage imageNamed:nameKey];
}

- (UIImage *)imageResourceByTheme:(NSString *)nameKey {
	if ([nameKey length] < 1) return nil;
    
	for (ThemeImage *image in themeImageList) {
		if ([image.key isEqualToString:nameKey])
			return image.image;
	}
//	if (DefaultTheme(themeKey)) {
//		return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:nameKey ofType:nil]];
//	}
//	else {
//		return [UIImage imageWithContentsOfFile:[themePath stringByAppendingPathComponent:[NSString stringWithFormat:@"images/%@", nameKey]]];
//	}
    return nil;
}

- (id)init {
	self = [super init];
	themeList = [[NSMutableArray alloc] initWithCapacity:5];
    
	themeImageList = [[NSMutableArray alloc] initWithCapacity:5];
    
	return self;
}

- (void)dealloc {
	self.patternBgColor = nil;
	[themePath release];
	[themeImageList release];
    
	[themeList release];
	[super dealloc];
}

- (void)open:(THEME)theme {
	[themePath release];
	themePath = nil;
    
	[themeImageList removeAllObjects];
    
    
	NSString *view_theme = nil;
    switch (theme) {
        case THEME_NORMAL:
            view_theme = @"theme_normal.xml";
            break;
        case THEME_DARK:
            view_theme = @"theme_dark.xml";
            break;
        case THEME_LIGHT:
            view_theme = @"theme_light.xml";
            break;
        default:
            break;
    }
    [Log i:TAG string:@"open theme >>> %@", view_theme];
	
    NSString *resourcePath = [[NSBundle mainBundle]  resourcePath];
    view_theme = [resourcePath stringByAppendingPathComponent:view_theme];
    
	[self openTheme:view_theme];
    
	self.patternBgColor = [UIColor colorWithPatternImage:[self imageByTheme:@"bg_gray.png"]];
}

- (void)openTheme:(NSString *)file {
	[themeList removeAllObjects];
    
    
	NSString *xml = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    
	GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithXMLString:xml options:0 error:nil];
	GDataXMLElement *rootElement = [xmlDoc rootElement];
	NSArray *array = [rootElement elementsForName:@"theme"];
	for (GDataXMLElement *element in array) {
		Theme *model = [[Theme alloc] init];
		NSString *value = [[element attributeForName:@"key"] stringValue];
		model.key = value;
        
		value = [[element attributeForName:@"textColor"] stringValue];
		if ([value length] > 0)
			model.textColor = [AppUtil colorConvertFromString:value];
        
		value = [[element attributeForName:@"highlightColor"] stringValue];
		if ([value length] > 0)
			model.highlightColor = [AppUtil colorConvertFromString:value];
        
		value = [[element attributeForName:@"disabledColor"] stringValue];
		if ([value length] > 0)
			model.disabledColor = [AppUtil colorConvertFromString:value];
        
        
		value = [[element attributeForName:@"backgroundColor"] stringValue];
		if ([value length] > 0)
			model.backgroundColor = [AppUtil colorConvertFromString:value];
        
		value = [[element attributeForName:@"fontSize"] stringValue];
		if ([value length] > 0)
			model.fontSize = [value floatValue];
        
		value = [[element attributeForName:@"fontName"] stringValue];
		if ([value length] > 0)
			model.fontName = value;
        
		value = [[element attributeForName:@"fontBold"] stringValue];
		if ([value length] > 0)
			model.fontBold = ([value integerValue] == 1);
        
        value = [[element attributeForName:@"backgroundImage"] stringValue];
		model.backgroundImage = value;
        
        value = [[element attributeForName:@"highlightImage"] stringValue];
		model.highlightImage = value;
        
		[themeList addObject:model];
		[model release];
	}
    
	[xmlDoc release];
}

- (Theme *)get:(NSString *)key {
	for (Theme *pojo in themeList) {
		if ([pojo.key isEqualToString:key])
			return pojo;
	}
	return nil;
}

@end
