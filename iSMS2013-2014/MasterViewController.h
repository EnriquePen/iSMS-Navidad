//
//  MasterViewController.h
//  iSMS2013-2014
//
//  Created by Álvaro Girona Arias on 15/07/13.
//  Copyright (c) 2013 Reckoner Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong,nonatomic) NSArray *arrSeleccion;


@end
