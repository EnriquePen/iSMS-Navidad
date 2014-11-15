//
//  SMSViewController.m
//  iSMS2013-2014
//
//  Created by Álvaro Girona Arias on 15/07/13.
//  Copyright (c) 2013 Reckoner Studios. All rights reserved.
//

#import "SMSViewController.h"
#import "SMSDetailViewController.h"


@interface SMSViewController ()

@end

@implementation SMSViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:self.strCategoriaSeleccionada ofType:@"plist"];
    self.arrSMS = [[NSArray alloc] initWithContentsOfFile:path];
    NSLog(@"%@",self.arrSMS);
        
    self.navigationItem.title = [NSString stringWithFormat:@"%@", self.strCategoriaSeleccionada];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrSMS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [[self.arrSMS objectAtIndex:indexPath.row] valueForKey:@"Titulo"];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier]isEqualToString:@"textoSMS"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSString *strSMS = [[NSString stringWithFormat:@"%@", [self.arrSMS objectAtIndex:indexPath.row]]valueForKey:@"Cuerpo"];
        NSString *texto = [[self.arrSMS objectAtIndex:indexPath.row] valueForKey:@"Cuerpo"];
        [[segue destinationViewController]setStrSMS:texto];
        NSLog(@"ARRAY %@",[NSString stringWithFormat:@"%@",[[self.arrSMS objectAtIndex:indexPath.row] valueForKey:@"Cuerpo"]]);
        NSLog(@"VALUE FOR KEY %@",[[self.arrSMS objectAtIndex:indexPath.row] valueForKey:@"Cuerpo"]);
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ 
}

@end
