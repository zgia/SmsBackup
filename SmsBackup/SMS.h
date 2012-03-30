//
//  SMS.h
//  SmsBackup
//
//  Created by zgia on 11-6-30.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SMS : NSObject {
	NSUInteger smsId;
	NSString *address;
	NSUInteger date;
	NSString *text;
	NSUInteger flasgs;
	NSUInteger groupId;
	NSUInteger associationId;
	NSUInteger UIFlags;
	NSString *subject;
	NSString *country;
	NSString *headers;
	NSString *recipients;
	BOOL read;
}

@property NSUInteger smsId;
@property (nonatomic, copy) NSString *address;
@property (nonatomic) NSUInteger date;
@property (nonatomic, copy) NSString *text;
@property (nonatomic) NSUInteger flasgs;
@property (nonatomic) NSUInteger groupId;
@property (nonatomic) NSUInteger associationId;
@property (nonatomic) NSUInteger UIFlags;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *headers;
@property (nonatomic, copy) NSString *recipients;
@property (nonatomic) BOOL read;
@end
