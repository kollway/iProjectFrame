//
// Created by Yaotian on 12/19/13.
// Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import "KWMDetailController.h"
#import "KWMToDoItem.h"


@implementation KWMDetailController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.detailItem != nil){
        self.titleLabel.text = self.detailItem.title;
    }else{
        self.titleLabel.text = @"No data";
    }
}

@end