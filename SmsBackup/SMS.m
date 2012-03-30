//
//  SMS.m
//  SmsBackup
//
//  Created by zgia on 11-6-30.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import "SMS.h"

@implementation SMS
@synthesize  smsId, address, date, text, flasgs, groupId, associationId, UIFlags, subject, country, headers, recipients, read;

- (NSString *)description
{	
	NSString *desc  = [NSString stringWithFormat:@"\naddress is: %@, \ntext is %@", address, text];
	
	return desc;
}

- (void)dealloc
{
	[address release];
	[text release];
    [super dealloc];
}
@end
