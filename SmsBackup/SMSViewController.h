//
//  SMSViewController.h
//  SmsBackup
//
//  Created by zgia on 11-6-30.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SMSViewController : UIViewController
{
    
}

@property (nonatomic, retain) SMS *sms;
@property (nonatomic, retain) IBOutlet UILabel *sender;
@property (nonatomic, retain) IBOutlet UILabel *senderTitle;
@property (nonatomic, retain) IBOutlet UILabel *sendTime;
@property (nonatomic, retain) IBOutlet UILabel *sendTimeTitle;
@property (nonatomic, retain) IBOutlet UITextView *text;

@end
