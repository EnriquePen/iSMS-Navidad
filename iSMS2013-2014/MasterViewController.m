//
//  MasterViewController.m
//  iSMS2013-2014
//
//  Created by Álvaro Girona Arias on 15/07/13.
//  Copyright (c) 2013 Reckoner Studios. All rights reserved.
//

#import "MasterViewController.h"

//#import "DetailViewController.h"

#import "SMSViewController.h"


@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    UIImage *background = [UIImage imageNamed:@"TableBG.png"];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:background];
    
    self.arrSeleccion = [[NSArray alloc] initWithObjects:@"Familia y amigos",@"Reyes Magos",@"Santa Claus", @"Adultos", nil];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    
    self.navigationItem.title = @"SMS";
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrSeleccion.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [self.arrSeleccion objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
       
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"irSMS"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = _objects[indexPath.row];
        //[[segue destinationViewController] setDetailItem:object];
        if (indexPath.row == 0) {
            //FAMILIA Y AMIGOS
            [[segue destinationViewController] setStrCategoriaSeleccionada:@"FamiliaAmigos"];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"FamiliaAmigos" ofType:@"plist"];
            NSArray *arr = [[NSArray alloc] initWithContentsOfFile:path];
            NSLog(@"%@",arr);
            [[segue destinationViewController] setArrSMS:arr];

        }
        if (indexPath.row == 1) {
            //REYES MAGOS
            [[segue destinationViewController] setStrCategoriaSeleccionada:@"ReyesMagos"];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"ReyesMagos" ofType:@"plist"];
            [[segue destinationViewController] setStrCategoriaSeleccionada:@"ReyesMagos"];
            NSArray *arr = [[NSArray alloc] initWithContentsOfFile:path];
            NSLog(@"%@",arr);
            [[segue destinationViewController] setArrSMS:arr];
            
            
        }
        if (indexPath.row == 2) {
            //FAMILIA Y AMIGOS
            [[segue destinationViewController] setStrCategoriaSeleccionada:@"SantaClaus"];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"SantaClaus" ofType:@"plist"];
            [[segue destinationViewController] setStrCategoriaSeleccionada:@"SantaClaus"];
            NSArray *arr = [[NSArray alloc] initWithContentsOfFile:path];
            NSLog(@"%@",arr);
            [[segue destinationViewController] setArrSMS:arr];
            
        }
        if (indexPath.row == 3) {
            //FAMILIA Y AMIGOS
            [[segue destinationViewController] setStrCategoriaSeleccionada:@"Adultos"];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"Adultos" ofType:@"plist"];
            [[segue destinationViewController] setStrCategoriaSeleccionada:@"Adultos"];
            NSArray *arr = [[NSArray alloc] initWithContentsOfFile:path];
            NSLog(@"%@",arr);
            [[segue destinationViewController] setArrSMS:arr];
            
        }
//        else;
//        [[segue destinationViewController] setStrTitulo:[self.arrSeleccion objectAtIndex:indexPath.row]];
    }
}

@end
