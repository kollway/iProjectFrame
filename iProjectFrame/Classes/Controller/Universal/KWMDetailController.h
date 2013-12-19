//
// Created by Yaotian on 12/19/13.
// Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KWMToDoItem;


@interface KWMDetailController : UIViewController

@property (nonatomic, strong) KWMToDoItem *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end