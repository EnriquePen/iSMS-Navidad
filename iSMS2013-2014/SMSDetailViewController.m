//
//  SMSDetailViewController.m
//  iSMS2013-2014
//
//  Created by Álvaro Girona Arias on 15/07/13.
//  Copyright (c) 2013 Reckoner Studios. All rights reserved.
//

#import "SMSDetailViewController.h"

@interface SMSDetailViewController ()

@end

@implementation SMSDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",self.strSMS);
    
    self.txtSMS.text = self.strSMS;
	// Do any additional setup after loading the view.
}

-(IBAction)enviarSMS:(id)sender{
    MFMessageComposeViewController *enviarSMS = [[MFMessageComposeViewController alloc] init];
    enviarSMS.messageComposeDelegate = self;
    enviarSMS.body = self.strSMS;
    [self presentViewController:enviarSMS animated:TRUE completion:nil];
    
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [self dismissViewControllerAnimated:TRUE completion:nil];
    
}
-(IBAction)postToFB:(id)sender{
    NSString* someText = self.strSMS;
    NSArray* dataToShare = @[someText];  // ...or whatever pieces of data you want to share.
    
    UIActivityViewController* activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:dataToShare
                                      applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:^{}];
    /*SLComposeViewController *facebookCompose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebookCompose setInitialText:self.strSMS];
    [self presentViewController:facebookCompose animated:YES completion:nil];*/
    
}
-(IBAction)postToTwitter:(id)sender{
    SLComposeViewController *twitterCompose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterCompose setInitialText:self.strSMS];
    [self presentViewController:twitterCompose animated:YES completion:nil];
}

-(IBAction)sendMail:(id)sender{
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
    mailController.mailComposeDelegate = self;
    [mailController setSubject:@"¡Feliz Navidad!"];
    [mailController setMessageBody:self.strSMS isHTML:FALSE];
    [self presentViewController:mailController animated:TRUE completion:nil];
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(IBAction)copiar:(id)sender{
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    paste.string = self.strSMS;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Texto copiado" message:@"El texto se ha copiado al portapapeles, puedes pegarlo en otra aplicación." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
