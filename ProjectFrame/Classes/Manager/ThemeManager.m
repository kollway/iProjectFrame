//
//  ThemeManager.m
//  ProjectFrame
//
//  Created by Sean on 13-9-4.
//
//

#import "ThemeManager.h"

#import "GDataXMLNode.h"

#define DefaultTheme(key)   [key isEqualToString:@"1.0"]

static ThemeManager* instance=nil;

@interface ThemeImage : NSObject

@property(nonatomic,retain) NSString* key;
@property(nonatomic,retain) UIImage* image;

@end





@implementation ThemeImage

@synthesize key;
@synthesize image;
-(void)dealloc{
    self.key=nil;
    self.image=nil;
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

-(id)init{
    self=[super init];
    
    return self;
}
-(void)dealloc{
    self.key=nil;
    self.textColor=nil;
    self.highlightColor=nil;
    self.disabledColor=nil;
    self.backgroundColor=nil;
    self.fontName=nil;
    [super dealloc];
}

-(UIFont*)font{
    if(self.fontName!=nil){
        return [UIFont fontWithName:self.fontName size:fontSize];
    }
    else{
        if(fontBold)
            return [UIFont boldSystemFontOfSize:fontSize];
        else
            return [UIFont systemFontOfSize:fontSize];
    }
}

@end

@implementation ThemeManager

@synthesize patternBgColor;

+ (ThemeManager *)sharedInstance {
    if(instance==nil)
        instance=[[ThemeManager alloc] init];
    return instance;
}


- (UIImage *) imageByTheme:(NSString*)nameKey {
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

-(UIImage*)imageResourceByTheme:(NSString *)nameKey{
    if([nameKey length]<1)return nil;
    
    for(ThemeImage* image in themeImageList){
        if([image.key isEqualToString:nameKey])
            return image.image;
    }
    if(DefaultTheme(themeKey)){
        return [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:nameKey ofType:nil]];
    }
    else{
        return [UIImage imageWithContentsOfFile:[themePath stringByAppendingPathComponent:[NSString stringWithFormat:@"images/%@",nameKey]]];
    }
}

-(id)init{
    self=[super init];
    themeList=[[NSMutableArray alloc] initWithCapacity:5];
    
    themeImageList=[[NSMutableArray alloc] initWithCapacity:5];
    
    return self;
}

-(void)dealloc{
    
    self.patternBgColor=nil;
    [themeKey release];
    [themePath release];
    [themeImageList release];
    
    [themeList release];
    [super dealloc];
}

-(BOOL)compareTheme:(NSString*)newTheme{
    return ([newTheme length]<1 || [themeKey isEqualToString:newTheme]);
}

-(void)open:(NSString*)theme{
    [themeKey release];
    themeKey=[theme retain];
    [themePath release];
    themePath=nil;
    
    [themeImageList removeAllObjects];
    
    
    NSString* view_theme=nil;
    if(DefaultTheme(themeKey)){
        NSString* resourcePath=[[NSBundle mainBundle]  resourcePath];
        view_theme= [resourcePath stringByAppendingPathComponent:@"view_theme.xml"];
        
    }
    else{
        /*
         themePath=[SCMPPathUtils tempZipThemePath];
         themePath=[themePath stringByAppendingPathComponent:themeKey];
         [themePath retain];
         view_theme= [themePath stringByAppendingPathComponent:@"xml/view_theme.xml"];
         */
    }
    
    [self openTheme:view_theme];
    
    self.patternBgColor=[UIColor colorWithPatternImage:[self imageByTheme:@"bg_gray6.png"]];
    
    
}

-(void)openTheme:(NSString*)file{
    [themeList removeAllObjects];
    
    
    NSString* xml=[NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    
    GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithXMLString:xml options:0 error:nil];
    GDataXMLElement *rootElement = [xmlDoc rootElement];
    NSArray *array = [rootElement elementsForName:@"theme"];
    for(GDataXMLElement* element in array){
        Theme* model=[[Theme alloc] init];
        NSString* value=[[element attributeForName:@"key"] stringValue];
        model.key=value;
        
        value=[[element attributeForName:@"textColor"] stringValue];
        if([value length]>0)
            model.textColor=[AppUtil colorConvertFromString:value];
        
        value=[[element attributeForName:@"highlightColor"] stringValue];
        if([value length]>0)
            model.highlightColor=[AppUtil colorConvertFromString:value];
        
        value=[[element attributeForName:@"disabledColor"] stringValue];
        if([value length]>0)
            model.disabledColor=[AppUtil colorConvertFromString:value];
        
        
        value=[[element attributeForName:@"backgroundColor"] stringValue];
        if([value length]>0)
            model.backgroundColor=[AppUtil colorConvertFromString:value];
        
        value=[[element attributeForName:@"fontSize"] stringValue];
        if([value length]>0)
            model.fontSize=[value floatValue];
        
        value=[[element attributeForName:@"fontName"] stringValue];
        if([value length]>0)
            model.fontName=value;
        
        value=[[element attributeForName:@"fontBold"] stringValue];
        if([value length]>0)
            model.fontBold=([value integerValue]==1);
        
        [themeList addObject:model];
        [model release];
    }
    
    [xmlDoc release];
    
}

- (Theme *)get:(NSString*)key {
    for(Theme* pojo in themeList){
        if([pojo.key isEqualToString:key])
            return pojo;
    }
    return nil;
}

@end
