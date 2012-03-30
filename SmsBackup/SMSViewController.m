//
//  SMSViewController.m
//  SmsBackup
//
//  Created by zgia on 11-6-30.
//  Copyleft 2011 zgia.net. All rights reserved.
//

#import "SMSViewController.h"
#import "MiscHelper.h"

@implementation SMSViewController

@synthesize sms = __sms;
@synthesize sender = __sender;
@synthesize senderTitle = __senderTitle;
@synthesize sendTime = __sendTime;
@synthesize sendTimeTitle = __sendTimeTitle;
@synthesize text = __text;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
	[__sms release];
	[__sender release];
	[__senderTitle release];
	[__sendTime release];
	[__sendTimeTitle release];
	[__text release];
	
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.navigationItem.title = self.sms.address;
	self.senderTitle.text = @"发信人:";
	self.sender.text = self.sms.address;
	self.sendTimeTitle.text = @"发送时间:";
	self.sendTime.text = [MiscHelper getFormatDate:self.sms.date dateFormatter: @"yyyy-MM-dd HH:mm"];
	self.text.text = self.sms.text;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
