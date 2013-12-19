//
//  KWMTestController.m
//  iProjectFrame
//
//  Created by Yaotian on 12/19/13.
//  Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import "KWMTestController.h"

@interface KWMTestController ()

- (IBAction)toggleEditing:(id)sender;

@end

@implementation KWMTestController

NSMutableArray *datas;

- (IBAction)toggleEditing:(id)sender {
    BOOL isEditing = self.dataTableView.isEditing;
    [self.dataTableView setEditing:!isEditing animated:YES];
    if(!isEditing){
        self.navigationItem.rightBarButtonItem.title = @"Done";
    }else{
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    int len = 30;
    datas = [[NSMutableArray alloc] initWithCapacity:len];
    for(int i = 0; i < len; i++){
        NSDate *now = [[NSDate alloc] init];
        [datas addObject:now];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = [[datas objectAtIndex:(NSUInteger) indexPath.row] description];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
         forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"editingStyle=%d", editingStyle);
    if (editingStyle == UITableViewCellEditingStyleDelete) {

    }
}

#pragma mark UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {

}


@end
