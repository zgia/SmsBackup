//
//  DB.h
//  SmsBackup
//
//  Created by zgia on 11-6-16.
//  Copyleft 2011 zgia.net. All rights reserved.
//

@interface DB : NSObject {
    
}
// 释放数据库链接
+ (void)finalizeStatements;
// 单例
+ (id) come;

// 获取所有短信
+ (NSMutableArray *) fetchSMSes;
// 获取短信数量
+ (NSUInteger) fetchSMSCount;

@end
