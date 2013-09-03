//
//  HttpClient.h
//  Iphone_SmartPhone
//
//  Created by sean zheng on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APIResponse;

@interface HttpClient : NSObject {
    NSString *httpSession;
    NSString *httpUrl;
    NSHTTPURLResponse *httpResponse;
}

@property (nonatomic, retain) NSString *httpBody;

- (id) initWithUrl: (NSString*) url;

- (id) initWithUrl: (NSString*) url session: (NSString*) needSession;

- (void) addParam: (NSString*) name value: (NSString*) value;

- (UIImage*) getImage;

- (NSString*) post: (APIResponse*) response;
- (NSString*) get: (APIResponse*) response;

- (NSString*) getSession;

@end
