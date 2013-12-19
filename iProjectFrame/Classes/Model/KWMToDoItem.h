//
//  KWMToDoItem.h
//  iProjectFrame
//
//  Created by Yaotian on 12/18/13.
//  Copyright (c) 2013 Kollway Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface KWMToDoItem : NSManagedObject

@property (nonatomic, retain) NSNumber * complete;
@property (nonatomic, retain) NSDate * createTime;
@property (nonatomic, retain) NSString * title;

@end
