//
//  SMSViewController.h
//  iSMS2013-2014
//
//  Created by Álvaro Girona Arias on 15/07/13.
//  Copyright (c) 2013 Reckoner Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMSViewController : UITableViewController

@property (strong, nonatomic) NSString *strTitulo;
@property (strong, nonatomic) NSString *strCategoriaSeleccionada;
@property (strong, nonatomic) NSArray *arrSMS;

@end
