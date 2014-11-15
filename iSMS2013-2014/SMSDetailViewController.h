//
//  SMSDetailViewController.h
//  iSMS2013-2014
//
//  Created by Álvaro Girona Arias on 15/07/13.
//  Copyright (c) 2013 Reckoner Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MessageUI/MessageUI.h>
#import <Social/Social.h>

@interface SMSDetailViewController : UIViewController<MFMessageComposeViewControllerDelegate, UIAlertViewDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) NSString *strSMS;

@property(weak, nonatomic) IBOutlet UITextView *txtSMS;

-(IBAction)enviarSMS:(id)sender;
-(IBAction)postToFB:(id)sender;
-(IBAction)postToTwitter:(id)sender;
-(IBAction)copiar:(id)sender;

@end
