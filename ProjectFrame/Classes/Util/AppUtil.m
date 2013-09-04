//
//  AppUtil.m
//  MyFrame
//
//  Created by Sean Zheng on 3/8/12.
//  Copyright (c) 2012 Kollway. All rights reserved.
//

#import "AppUtil.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "Reachability.h"
#import <CommonCrypto/CommonDigest.h>

#include <sys/types.h>

#include <sys/sysctl.h>

#include <sys/socket.h> // Per msqr
#include <net/if.h>
#include <net/if_dl.h>

@implementation AppUtil

+ (NSString *)laguage {
    return @"en";
} 

+ (BOOL)isRetain4 {
    CGSize size=[[UIApplication sharedApplication] delegate].window.bounds.size;
    return (size.height>480.0f);
}

+ (NSString*)getAppName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

+ (NSString*)trim:(NSString*)value {
    return [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] ];
}

+ (BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (NSString *)macAddress {
    
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

+ (NSString *)uuid {
    
    NSUserDefaults *handler = [NSUserDefaults standardUserDefaults];
    
    NSString *uuidStr = [handler stringForKey:@"uuid_key"];
    if(uuidStr!=nil && [uuidStr length]>0)return uuidStr;
    
    NSString *macaddress = [AppUtil macAddress];
    if(macaddress==nil || [macaddress length]<1){
        CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
        macaddress = [(NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject) autorelease];
        CFUUIDGetUUIDBytes(uuidObject);
        CFRelease(uuidObject);
    }
    uuidStr = [AppUtil stringFromMD5:macaddress];
    
    [handler setValue:uuidStr forKey:@"uuid_key"];
    
    return uuidStr;
}

+ (NSString *) stringFromMD5:(NSString*)key{
    
    if(key == nil || [key length] == 0)
        return nil;
    
    const char *value = [key UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return [outputString autorelease];
}

+ (BOOL) hasInternetConnectionStatus{
    BOOL hasInternetConnection = NO;
    
//    Reachability *internetReach = [[Reachability reachabilityForInternetConnection] retain];
//    [internetReach startNotifier];
//    
//    NetworkStatus netStatus = [internetReach currentReachabilityStatus];
//    switch (netStatus) {
//        case NotReachable:
//			hasInternetConnection = NO;
//            break;
//        case ReachableViaWWAN:
//			hasInternetConnection = YES;
//            break;
//        case ReachableViaWiFi:
//			hasInternetConnection = YES;
//            break;
//    }
//    
//    [internetReach release];
    
    return hasInternetConnection;
}

+ (UIColor *)colorConvertFromString:(NSString*)value {
    if([value length]<7)return [UIColor whiteColor];
    
    SEL blackSel = NSSelectorFromString(value);
    if ([UIColor respondsToSelector: blackSel]){
        UIColor* color  = [UIColor performSelector:blackSel];
        if(color!=nil)
            return color;
    }
    
    NSRange range;
    range.location=1;
    range.length=2;
    NSString* r=[NSString stringWithFormat:@"0x%@",[value substringWithRange:range]];
    range.location=3;
    NSString* g=[NSString stringWithFormat:@"0x%@",[value substringWithRange:range]];
    range.location=5;
    NSString* b=[NSString stringWithFormat:@"0x%@",[value substringWithRange:range]];
    
    
    float rColor=0;
    float gColor=0;
    float bColor=0;
    float alpha=1;
    
    [[NSScanner scannerWithString:r] scanHexFloat:&rColor];
    [[NSScanner scannerWithString:g] scanHexFloat:&gColor];
    [[NSScanner scannerWithString:b] scanHexFloat:&bColor];
    
    
    rColor=rColor / 255;
    gColor=gColor / 255;
    bColor=bColor / 255;
    
    
    if([value length]==9){
        range.location=7;
        NSString* a=[NSString stringWithFormat:@"0x%@",[value substringWithRange:range]];
        
        [[NSScanner scannerWithString:a] scanHexFloat:&alpha];
        
        alpha=alpha / 255;
    }
    
    return [UIColor colorWithRed:rColor green:gColor blue:bColor alpha:alpha];
}


@end
