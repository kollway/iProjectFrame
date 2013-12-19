//
//  KWMAppDelegate.h
//  iProjectFrame
//
//  Created by Yaotian on 12/17/13.
//  Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KWMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
