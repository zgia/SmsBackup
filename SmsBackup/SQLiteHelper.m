//
//  SQLiteHelper.m
//  SmsBackup
//
//  Created by zgia on 10-9-8.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import "SQLiteHelper.h"

@implementation SQLiteHelper
@synthesize database;

// The database is stored in the application bundle. 
- (NSString *) sqliteDataFilePath
{
	//#if TARGET_IPHONE_SIMULATOR
	//NSString *path = [[NSBundle mainBundle] pathForResource:@"date" ofType:@"dat"];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:kSQLiteFileName];
	//NSLog(@"%@", path);
	
	return path;
}

// Open the database connection and retrieve minimal information for all objects.
- (void) initializeDatabase
{
    // Open the database. The database was prepared outside the application.	
    if (sqlite3_open([[self sqliteDataFilePath] UTF8String], &database) != SQLITE_OK)
	{
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
}

- (void) closeDatabase
{
	// Close the database.
    if (sqlite3_close(database) != SQLITE_OK)
	{
        NSAssert1(0, @"Error: failed to close database with message '%s'.", sqlite3_errmsg(database));
    }
}

// Creates a writable copy of the bundled default database in the application Documents directory.
- (void) createEditableCopyOfDatabaseIfNeeded
{
    // First, test for existence.
    NSFileManager *fileManager = [NSFileManager defaultManager];
	
    NSString *writableDBPath = [self sqliteDataFilePath];
    BOOL success = [fileManager fileExistsAtPath: writableDBPath];
    if (success)
	{
		return;
	}
	
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:kSQLiteFileName];
	//defaultDBPath = [@"/Root/User/Library/SMS/" stringByAppendingPathComponent:kSQLiteFileName];
    NSError *error;
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    
	if (!success)
	{
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}

- (void) vacuumDataBase
{
	//const char *sql = "BEGIN;VACUUM;COMMIT;";
	//sqlite3_exec(database, sql, 0, 0, 0);

	sqlite3_stmt *statement;
	
	static char *sql = "VACUUM";
	if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) != SQLITE_OK)
	{
		NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
	}	
	int success = sqlite3_step(statement);
	sqlite3_finalize(statement);
	
	if (success == SQLITE_ERROR)
	{
		NSAssert1(0, @"Error: failed to VACUUM the database with message '%s'.", sqlite3_errmsg(database));
	}
}
@end
