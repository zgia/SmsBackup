//
//  MiscHelper.h
//  SmsBackup
//
//  Created by zgia on 10-9-13.
//  Copyleft 2011 zgia.net. All rights reserved.
//

@interface MiscHelper : NSObject {

}

// 获取自1970年以来的秒数
+ (NSUInteger)getUnixTimestamp;
// 获取某个时间(2010-10-10)的UNIX时间戳
+ (NSUInteger)getUnixTimestamp:(NSString *)dateStr dateFormatter:(NSString *)formatter;
// 获取格式化的日期：当前时间
+ (NSString *)getFormatDate:(NSString *)formatter;
// 获取格式化的日期：指定时间
+ (NSString *)getFormatDate:(NSUInteger)unixTimestamp dateFormatter:(NSString *)formatter;
// 获取格式化的日期：将某个日期(20101010)格式化为另一个格式的日期(2010年10月10日)
+ (NSString *)getFormatDate:(NSString *)dateStr fromDateFormatter:(NSString *)from toDateFormatter:(NSString *)to;

@end
