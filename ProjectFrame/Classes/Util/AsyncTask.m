//
//  AsyncTask.m
//  Iphone_SmartPhone
//
//  Created by ko lanner on 12-2-10.
//  Copyright (c) 2012年 Kollway. All rights reserved.
//

#import "AsyncTask.h"

@implementation AsyncTask

@synthesize viewHolder;
@synthesize doInBackground;
@synthesize postExecute;
@synthesize preExecute;
@synthesize failExecute;
@synthesize progressUpdate;
@synthesize cancelExecute;

+(id)asyncTaskWithTarget: (id) target {
    id instance = [[self alloc] initTaskWithTarget:target];
    return [instance autorelease];
}

-(id)initTaskWithTarget:(id)target {
    self = [super init];
    if (self) {
        dictionary = [[NSMutableDictionary alloc] init];
        _target = target;
    }
    return self;
}

-(void)dealloc {
    [dictionary release];
    [handelThread release];
    [super dealloc];
}

-(void)execute{
    [self onPreExecute];
    handelThread = [[NSThread alloc] initWithTarget:self selector:@selector(runBackgroundThread) object:nil];
    [handelThread start];
}

-(void)runBackgroundThread{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    id result = nil;
    if(_target) {
        result = [_target performSelector:doInBackground withObject:self];
    }
    if(result) {
        [self performSelectorOnMainThread:@selector(onPostExecute) withObject:nil waitUntilDone:NO];
    } 
    [pool release];
}

-(void)onPostExecute {
    if(postExecute && _target) {
        NSLog(@"AsyncTask >> postExecute...");
        [_target performSelector:postExecute withObject:self];
    }
}

-(void)onPreExecute{
    if(preExecute && _target) {
        NSLog(@"AsyncTask >> onPreExecute...");
        [_target performSelector:preExecute withObject:self];
    }
}

-(void)onFailExecute{
    if(failExecute && _target) {
        NSLog(@"AsyncTask >> onFailExecute...");
        [_target performSelector:failExecute ];
    }
}

-(void)onProgressUpdate:(id)target{
    if(progressUpdate && _target) {
        NSLog(@"AsyncTask >> onProgressUpdate...");
        [_target performSelectorOnMainThread:progressUpdate withObject:target waitUntilDone:NO];
    }
}

-(void)onCancel {
    if(cancelExecute && _target) {
        NSLog(@"AsyncTask >> onCancel...");
        [_target performSelector:cancelExecute];
    }
}

-(void)cancel{
//    NSLog(@"AsyncTask >> isFinish:%d isCanceled:%d isExecuting:%d", [handelThread isFinished], [handelThread isCancelled], [handelThread isExecuting]);
    if(![handelThread isCancelled] && [handelThread isExecuting]) {
        NSLog(@"AsyncTask >> cancel...");
        [handelThread cancel];
        [self onCancel];
    }
}

-(BOOL)isCanceled {
    return [handelThread isCancelled];
}

-(void)setValue:(id)value forKey:(NSString*) key{
    [dictionary setValue:value forKey:key];
}

-(id)valueForKey:(NSString*) key{
    return [dictionary valueForKey:key];
}

@end
