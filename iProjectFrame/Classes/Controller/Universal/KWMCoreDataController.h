//
// Created by Yaotian on 12/18/13.
// Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWMCoreDataController.h"
#import "KWMBaseController.h"

@interface KWMCoreDataController : UIViewController
        <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>{

}

@property (weak, nonatomic) IBOutlet UITableView *dataTableView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end