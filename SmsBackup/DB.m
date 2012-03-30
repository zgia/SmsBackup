//
//  DB.m
//  SmsBackup
//
//  Created by zgia on 11-6-16.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import "DB.h"
#import "MiscHelper.h"
#import "SQLiteHelper.h"

@implementation DB

static sqlite3 *kDatabase;
static SQLiteHelper *kSqlite;

//static sqlite3_stmt *fetchSMSStatement = nil;

// Finalize (delete) all of the SQLite compiled queries.
+ (void) finalizeStatements
{	
	[kSqlite closeDatabase];
}

// 单例
+ (id) come
{
	return [[[self alloc] init] autorelease];
}

-(id) init
{
	if ((self=[super init]) ) {
		if (kDatabase == nil)
		{
			if (kSqlite == nil) {
				kSqlite = [[SQLiteHelper alloc] init];
			}
			[kSqlite createEditableCopyOfDatabaseIfNeeded];
			[kSqlite initializeDatabase];
			
			kDatabase = [kSqlite database];
		}
	}
	
	return self;
}

// 获取所有短信
+ (NSMutableArray *) fetchSMSes
{
	NSMutableArray *smses = [NSMutableArray array];
	
	sqlite3_stmt *statement;
	const char *sql = "SELECT ROWID,address,date,text,group_id,association_id,subject FROM message ORDER BY ROWID DESC";
	if (sqlite3_prepare_v2(kDatabase, sql, -1, &statement, NULL) != SQLITE_OK) {
		NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(kDatabase));
	}
	
	while (sqlite3_step(statement) == SQLITE_ROW)
	{
		SMS *sms = [[SMS alloc] init];

		sms.smsId = sqlite3_column_int(statement, 0);
		sms.address = sqlite3_column_text(statement, 1) == NULL ? nil : [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];;
		sms.date = sqlite3_column_int(statement, 2);
		sms.text = sqlite3_column_text(statement, 3) == NULL ? nil : [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)];;
		sms.groupId = sqlite3_column_int(statement, 4);
		sms.associationId = sqlite3_column_int(statement, 5);
		sms.subject = sqlite3_column_text(statement, 6) == NULL ? nil : [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)];;
		
		[smses addObject:sms];
	}
	
	// Reset the statement for future reuse.
	sqlite3_finalize(statement);
	
	return smses;
}

// 获取短信数量
+ (NSUInteger) fetchSMSCount
{
	sqlite3_stmt *statement;
	
	const char *sql = "SELECT COUNT(*) AS amount FROM message";
	if (sqlite3_prepare_v2(kDatabase, sql, -1, &statement, NULL) != SQLITE_OK) {
		NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(kDatabase));
	}
	
	NSUInteger count = 0;	
	if (sqlite3_step(statement) == SQLITE_ROW)
	{
		count = sqlite3_column_int(statement, 0);
	}
	
	sqlite3_finalize(statement);
	
	return count;
}

@end
