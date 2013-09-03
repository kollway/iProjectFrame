//
//  HttpClient.m
//  Iphone_SmartPhone
//
//  Created by sean zheng on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HttpClient.h"
#import "Constant.h"

@implementation HttpClient

@synthesize httpBody;

- (id)initWithUrl:(NSString *)url {
    self = [super init];
    if(self) {
        httpUrl = url;
        [httpUrl retain];
        httpSession = nil;
    }
    return self;
}


-(id)initWithUrl:(NSString *)url session:(NSString*)session {
    self = [super init];
    if(self) {
        httpUrl = url;
        httpSession = session;
        
        [httpUrl retain];
        [httpSession retain];
    }
    return self;
}

- (void) dealloc {
    [httpSession release];
    [httpUrl release];
    [httpBody release];
    [super dealloc];
}

-(void)addParam:(NSString *)name value:(NSString *)value {
    if(httpBody) {
        NSString *tmpStr = httpBody;
        httpBody = [tmpStr stringByAppendingFormat:@"&%@=%@", name, value];
        [tmpStr release];
    } else {
        httpBody = [[NSString alloc] initWithFormat:@"?%@=%@", name, value]; 
    }
    NSLog(@"http param >>> %@", httpBody);
}

-(UIImage *)getImage {
    NSURL *url = [NSURL URLWithString:httpUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    if(httpSession) {
        [request addValue:@"Cookie" forHTTPHeaderField:[NSString stringWithFormat:@"Session=%@", httpSession]];
    }
    [request setHTTPMethod:@"GET"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&httpResponse error:nil];
    return [UIImage imageWithData:data];
}

-(NSString *)post: (APIResponse*) apiResponse {
    NSString *result = nil;
    
    NSLog(@"http post >>> %@", httpUrl);
    NSURL *url = [NSURL URLWithString:httpUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    if(httpSession) {
        [request addValue:@"Cookie" forHTTPHeaderField:[NSString stringWithFormat:@"Session=%@", httpSession]];
    }
    
    if(httpBody) {
        [request setHTTPBody:[httpBody dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [request setHTTPMethod:@"POST"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&httpResponse error:nil];
    if(httpResponse.statusCode == 200) {
        result = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
//         apiResponse.apiStatus = ApiStatusSuccess;
        NSLog(@"http response >>> \n%@", result);
    } else {
//        apiResponse.apiStatus = ApiStatusNetworkError;
    }
    return result;
}

-(NSString *)get:(APIResponse *)apiResponse {
    NSString *result = nil;
    
    if(httpBody) {
        NSString *tmpUrl = [NSString stringWithString:httpUrl];
        [httpUrl release];
        httpUrl = [tmpUrl stringByAppendingString:httpBody];
    }
    
    NSLog(@"http get >>> %@", httpUrl);
    NSURL *url = [NSURL URLWithString:httpUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    if(httpSession) {
        [request addValue:@"Cookie" forHTTPHeaderField:[NSString stringWithFormat:@"Session=%@", httpSession]];
    }
    [request setHTTPMethod:@"GET"];

    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&httpResponse error:nil];
    if(httpResponse.statusCode == 200) {
        result = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
//        apiResponse.apiStatus = ApiStatusSuccess;
        NSLog(@"http response >>> \n%@", result);
    } else {
//        apiResponse.apiStatus = ApiStatusNetworkError;
    }
    return result;
}

-(NSString *)getSession {
    NSString *session = nil;
    if(httpResponse) {
        if ([httpResponse respondsToSelector:@selector(allHeaderFields)]) {
            NSDictionary *dictionary = [httpResponse allHeaderFields];
            
            NSString *cookieStr = [dictionary valueForKey:@"Server"];
            NSRange range = [cookieStr rangeOfString:@"="];
            if (range.location != NSNotFound) {
                session = [cookieStr substringFromIndex:range.location + 1];
                NSLog(@"http get session >>>>  %@", session);
            }
        }
    }
    return session;
}

@end
