//
//  KWMMenuController.m
//  iProjectFrame
//
//  Created by Yaotian on 12/17/13.
//  Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import "KWMMenuController.h"

@interface KWMMenuController (){
    NSMutableDictionary *controllers;
}

@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation KWMMenuController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menuItems = [NSArray arrayWithObjects:@"First", @"Second", @"Third", @"CoreData", nil];
    self->controllers = [[NSMutableDictionary alloc] initWithCapacity:10];
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (void)viewDidUnload {
    [super viewDidUnload];

    if(self->controllers != nil){
        [self->controllers removeAllObjects];
    }
}

- (void)didReceiveMemoryWarning {
    if(self->controllers != nil && self->controllers.count > 0){
        NSMutableArray *beRemoveKeys = [[NSMutableArray alloc] initWithCapacity:self->controllers.count];
        NSArray *keyArray = self->controllers.allKeys;
        for(NSString *key in keyArray){
            id value = [self->controllers objectForKey:key];
            if(value != self.slidingViewController.topViewController){
                [beRemoveKeys addObject:key];
            }
        }

        for(id key in self->controllers){
            [self->controllers removeObjectForKey:key];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.menuItems objectAtIndex:(NSUInteger) indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) sectionIndex{
    return self.menuItems.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [self.menuItems objectAtIndex:(NSUInteger) indexPath.row];
    
    UIViewController *newTopViewController = [self->controllers objectForKey:identifier];
    if(newTopViewController == nil){
        newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        [self->controllers setObject:newTopViewController forKey:identifier];
    }
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}


@end
