//
//  KWMTestController.h
//  iProjectFrame
//
//  Created by Yaotian on 12/19/13.
//  Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KWMTestController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@end
