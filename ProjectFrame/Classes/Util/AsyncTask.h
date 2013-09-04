//
//  AsyncTask.h
//  Iphone_SmartPhone
//
//  Created by ko lanner on 12-2-10.
//  Copyright (c) 2012年 Kollway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsyncTask : NSObject{
    NSThread *handelThread;
    NSMutableDictionary *dictionary;
    id _target;
}

@property (assign, nonatomic) UIView *viewHolder;
@property (assign, nonatomic) SEL doInBackground;
@property (assign, nonatomic) SEL postExecute;
@property (assign, nonatomic) SEL preExecute;
@property (assign, nonatomic) SEL failExecute;
@property (assign, nonatomic) SEL progressUpdate;
@property (assign, nonatomic) SEL cancelExecute;

+(id)asyncTaskWithTarget:(id)target;
-(id)initTaskWithTarget:(id)target;
-(void)onFailExecute;
-(void)onPreExecute;
-(void)onPostExecute;
-(void)onCancel;
-(void)onProgressUpdate:(id)target;
-(void)execute;
-(void)cancel;
-(BOOL)isCanceled;
-(void)setValue:(id)value forKey:(NSString*) key;
-(id)valueForKey:(NSString*) key;

@end
