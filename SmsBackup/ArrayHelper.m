//
//  ArrayHelper.m
//  SmsBackup
//
//  Created by zgia on 11-6-14.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import "ArrayHelper.h"

// This category enhances NSMutableArray by providing
// methods to randomly shuffle the elements.
@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end

@implementation NSMutableArray (Shuffling)
- (void)shuffle
{	
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        int n = (arc4random() % (count - i)) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}
@end


@implementation ArrayHelper

+ (id) arrayWithRandomElements: (NSArray *)anArray elements: (int)numbers
{
	// 如果数量为0或者负数，则返回nil
	if (numbers < 1)
	{
		return nil;
	}
	
	int count = [anArray count];
	
	// 如果数量大于数组长度，则返回原数组
	if (numbers >= count)
	{
		return anArray;
	}
	
	NSMutableArray *newArray = [NSMutableArray arrayWithArray:anArray];
	/*
	for(int i = 0; i< count; i++)
	{
		int m = (arc4random() % (count - i)) + i;
		[newArray exchangeObjectAtIndex:i withObjectAtIndex: m];
	}
	 */
	[newArray shuffle];
	
	NSRange theRange;
	theRange.location = 0;
	theRange.length = numbers;
	
	return [newArray subarrayWithRange:theRange];
}

@end
