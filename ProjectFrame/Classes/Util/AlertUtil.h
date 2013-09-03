//
//  AlertUtil.h
//  Iphone_SmartPhone
//
//  Created by sean zheng on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertUtil : NSObject

+ (void) showAlert: (NSString*) title message: (NSString*) message;

+(void)showAlert:(NSString*)title message:(NSString*)message delegate:(id)delegate;

+ (void) showOKCancelAlert: (NSString*) title message: (NSString*) message delegate:(id) delegate;

+ (void)showAlert:(NSString *)title message:(NSString *)message textAlign: (UITextAlignment) align;

+ (void) showLoading;

+ (void) closeLoading;

@end
