//
//  MiscHelper.m
//  SmsBackup
//
//  Created by zgia on 10-9-13.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import "MiscHelper.h"

@implementation MiscHelper

// 获取自1970年以来的秒数
+ (NSUInteger)getUnixTimestamp
{
	return (int) [[NSDate date] timeIntervalSince1970];
}

// 获取某个时间(2010-10-10)的UNIX时间戳
+ (NSUInteger)getUnixTimestamp:(NSString *)dateStr dateFormatter:(NSString *)formatter
{
	NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:formatter];
    NSDate *myDate = [df dateFromString: dateStr];
	
    return (int) [myDate timeIntervalSince1970];
}

// 获取格式化的日期：当前时间
+ (NSString *)getFormatDate:(NSString *)formatter
{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:formatter];
	
	NSString *date = [df stringFromDate:[NSDate date]];
	
	[df release];
	
	return date;
}

// 获取格式化的日期：指定时间
+ (NSString *)getFormatDate:(NSUInteger)unixTimestamp dateFormatter:(NSString *)formatter
{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:formatter];
	
	NSString *date = [df stringFromDate:[NSDate dateWithTimeIntervalSince1970:unixTimestamp]];
	
	[df release];
	
	return date;
}

// 获取格式化的日期：将某个日期(20101010)格式化为另一个格式的日期(2010年10月10日)
+ (NSString *)getFormatDate:(NSString *)dateStr fromDateFormatter:(NSString *)from toDateFormatter:(NSString *)to
{
	NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:from];
    NSDate *myDate = [df dateFromString: dateStr];
	
	
	NSDateFormatter *dfx = [[NSDateFormatter alloc] init];
	[dfx setDateFormat:to];
	
	NSString *date = [dfx stringFromDate:myDate];
	
	[dfx release];
	
	return date;
}
@end
