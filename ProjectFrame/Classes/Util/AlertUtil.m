//
//  AlertUtil.m
//  Iphone_SmartPhone
//
//  Created by sean zheng on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AlertUtil.h"

static UIAlertView *alertView = nil;

@implementation AlertUtil

+(void)showLoading {
    alertView = [[UIAlertView alloc] initWithFrame:CGRectMake(110, 160, 100, 100)];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicatorView setFrame:CGRectMake(25.0f, 10.0f, 50.0f, 50.0f)];
    [alertView addSubview:indicatorView];
    [indicatorView startAnimating];
    [indicatorView release];
    
    UILabel *lableMessage = [[UILabel alloc] init];
    [lableMessage setFrame:CGRectMake(50.0f, -2.0f, 200.0f, 50.0f)];
    [lableMessage setFont:[UIFont fontWithName:nil size:9]];
    [lableMessage setTextColor:[UIColor whiteColor]];
    [lableMessage setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    lableMessage.text = NSLocalizedString(@"Loading", @"");
    [indicatorView addSubview:lableMessage];
    [lableMessage release];
    [alertView show];
}

//+(void)showAlertWithFormat:(NSString *)format, ... {
//    [NSString stringWithFormat:format, ...];
//}

+(void)closeLoading {
    if(alertView) {
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        [alertView release];
    }
    alertView = nil;
}

+ (void)showAlert:(NSString *)title message:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(title, @"") message:NSLocalizedString(message, @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil, nil];
    
    [alert show];
    [alert release];
}

+(void)showAlert:(NSString*)title message:(NSString*)message delegate:(id)delegate {
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setMessage:NSLocalizedString(message, @"")];
    [alert setTitle:NSLocalizedString(title, @"")];
    [alert addButtonWithTitle:NSLocalizedString(@"OK", @"")];
    [alert setDelegate:delegate];
    [alert show];
    [alert release];
}

+(void)showOKCancelAlert:(NSString *)title message:(NSString *)message delegate:(id) delegate {
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setMessage:NSLocalizedString(message, @"")];
    [alert setTitle:NSLocalizedString(title, @"")];
    [alert addButtonWithTitle:NSLocalizedString(@"Cancel", @"")];
    [alert addButtonWithTitle:NSLocalizedString(@"OK", @"")];
    [alert setDelegate:delegate];
    [alert show];
    [alert release];
}

+ (void)showAlert:(NSString *)title message:(NSString *)message textAlign: (UITextAlignment) align {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(title, @"") message:NSLocalizedString(message, @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil, nil];
    
    Boolean hasTitle = false;
    if(title) {
        hasTitle = true;
    }
    NSArray *subViewArray = alert.subviews;
    for(int i = 0; i < [subViewArray count]; i ++) {
        if([[[subViewArray objectAtIndex:i] class] isSubclassOfClass:[UILabel class]]) {
            if(hasTitle) {
                hasTitle = false;
                continue;
            }
            UILabel *label = [subViewArray objectAtIndex:i];
            label.textAlignment = align;
        }
    }
    
    [alert show];
    [alert release];
}

@end
