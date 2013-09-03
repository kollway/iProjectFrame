//
//  MySqlite.m
//  TextForSqlite
//
//  Created by 肖 昶 on 12-4-18.
//  Copyright (c) 2013年 广州绿蕃茄科技有限公司. All rights reserved.
//

#import "SqliteLib.h"
@implementation SqliteLib

-(void)dealloc{
    [self close];
    [super dealloc];
}

-(void)open:(NSString*)dbName{
    [self close];
    //NSArray* list=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString* documentDir=[list objectAtIndex:0];
    //NSString* path=[documentDir stringByAppendingPathComponent:dbName];
    if(sqlite3_open([dbName UTF8String], &db) != SQLITE_OK){//无法数据库
        sqlite3_close(db);
        db=nil;
    }
    
}

-(void)close{
    if(dbResult!=NULL){
        sqlite3_finalize(dbResult);
        dbResult=NULL;
    }
    if(db!=NULL){
        sqlite3_close(db);
        db=NULL;
    }
}

-(NSString*)stringValue:(int)_column{
    if(db==nil || dbResult==nil)return @"";
    const char* result=(const char*)sqlite3_column_text(dbResult , _column);
    if(result==nil)return @"";
    
    return [NSString stringWithCString:result encoding:NSUTF8StringEncoding];
    
}

-(long long)longLongValue:(int)_column{
    NSString* str=[self stringValue:_column];
    return [str longLongValue];
}

-(double)doubleValue:(int)_column{
    NSString* str=[self stringValue:_column];
    return [str doubleValue];
}

-(BOOL)boolValue:(int)_column{
    NSString* str=[self stringValue:_column];
    return [str boolValue];
}

-(BOOL)execute:(NSString*)query{
	if(db==nil)return NO;
    NSAutoreleasePool* pool=[[NSAutoreleasePool alloc] init];
	if(dbResult!=nil)
	{
		sqlite3_finalize(dbResult);
		dbResult=nil;
	}
    const char* sql=[query UTF8String];
	sqlite3_exec(db, "pragma synchronous = off", nil, nil, nil);
    
	if(strstr(sql,"delete")!=nil || strstr(sql,"DELETE")!=nil || strstr(sql,"Delete")!=nil)
		sqlite3_exec(db, sql, nil, nil, nil);
	else
	{
		sqlite3_stmt *statement = nil;
		sqlite3_prepare(db, sql, -1, &statement, NULL);
		sqlite3_step(statement);
		sqlite3_finalize(statement);
	}
    [pool release];
    return YES;
}

-(BOOL)query:(NSString*)query{
    if(db==nil)return NO;
	if(dbResult!=nil){
		sqlite3_finalize(dbResult);
		dbResult=nil;
	}
    const char* sql=[query UTF8String];
	int rc = sqlite3_prepare_v2(db , sql , -1 , &dbResult , nil);
	if(rc!=SQLITE_OK)
	{
		if(dbResult!=nil)
		{
			sqlite3_finalize(dbResult);
			dbResult=nil;
		}
		return NO;
	}
	return YES;
}

-(BOOL)next{
    if(db==nil || dbResult==nil)return NO;
    return (sqlite3_step(dbResult)==SQLITE_ROW);
}

-(void)prepare:(NSString*)query{
    if(db==nil)return;
	if(dbResult!=nil){
		sqlite3_finalize(dbResult);
		dbResult=nil;
	}
    const char* sql=[query UTF8String];

    sqlite3_prepare(db, sql, -1, &dbResult, nil);

}

-(void)bind:(NSString*)value index:(int)index{
    if(db==nil || dbResult==nil)return;
    if([value length]<1)value=@"";
    const char* sql=[value UTF8String];

    sqlite3_bind_text(dbResult, index+1, sql,-1,nil );
}

-(void)bindInt:(int)value index:(int)index{
    if(db==nil || dbResult==nil)return;
    sqlite3_bind_int(dbResult, index+1, value );

}

-(void)bindFloat:(float)value index:(int)index{
    if(db==nil || dbResult==nil)return;
    sqlite3_bind_double(dbResult, index+1, value );

}

-(void)finalize{
    if(db==nil || dbResult==nil)return;
    if (sqlite3_step(dbResult) != SQLITE_DONE){
//        const char* msg=sqlite3_errmsg(db);
//        msg=NULL;
    }

    sqlite3_finalize(dbResult);
    dbResult=NULL;

}

@end


