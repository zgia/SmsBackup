//
//  ArrayHelper.h
//  SmsBackup
//
//  Created by zgia on 11-6-14.
//  Copyleft 2011 zgia.net. All rights reserved.
//


@interface ArrayHelper : NSObject
{
    
}

// 从某个数组中取指定数量的随机元素，并组成一个新数组。
// 如果数量大于数组长度，则返回原数组；
// 如果数量为0或者负数，则返回nil
+ (id) arrayWithRandomElements: (NSArray *)anArray elements: (int)numbers;

@end
