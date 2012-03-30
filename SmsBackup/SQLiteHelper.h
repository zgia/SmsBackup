//
//  SQLiteHelper.h
//  SmsBackup
//
//  Created by zgia on 10-9-8.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface SQLiteHelper : NSObject {
	sqlite3 *database;
}

@property (nonatomic) sqlite3 *database;

- (void) initializeDatabase;
- (NSString *) sqliteDataFilePath;
- (void) closeDatabase;
- (void) createEditableCopyOfDatabaseIfNeeded;
- (void) vacuumDataBase;
@end
