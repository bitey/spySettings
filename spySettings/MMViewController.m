//
//  MMViewController.m
//  spySettings
//
//  Created by spawrks on 2/13/13.
//  Copyright (c) 2013 spawrks. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()
{

}
@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;
@end

@implementation MMViewController
@synthesize tableContents;
@synthesize sortedKeys;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *weapons = [[NSArray alloc]initWithObjects:@"Laser",@"Oil Slick",@"Crazy Monkey With A Gun", nil];
    NSArray *bluetooth = [[NSArray alloc]initWithObjects:@"Pair",@"UnPair",@"Blow Up", nil];
    NSArray *privacy = [[NSArray alloc]initWithObjects:@"Password Lock",@"Password Self Destruct", nil];
    
    self.tableContents = @{@"Weapons": weapons,
                           @"Bluetooth":bluetooth,
                           @"Privacy"  :privacy,
                           };
    
    self.sortedKeys = [self.tableContents allKeys];
    

    //    Key  |   Value
    //     0       Weapons
    //     1       Bluetooth
    //     2       Privacy
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sortedKeys count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [self.sortedKeys objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * arrayOfDataInASection = [self.tableContents objectForKey:
                                       [self.sortedKeys objectAtIndex:section]
                                       ];
    return [arrayOfDataInASection count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	
    //1. create cell
    UITableViewCell * currentCell;
    
    //2. see if there are any cells we can reuse
    currentCell = [tableView dequeueReusableCellWithIdentifier:@"myCellsToReuse"];
	
    //3. if not, create one to use!
	if(currentCell == nil)
    {
        currentCell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:@"myCellsToReuse"];
	}
	//4. change the textLabel to reflect the data we are using.
    NSArray *sectionItems =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
	currentCell.textLabel.text = [sectionItems objectAtIndex:[indexPath row]];
	return currentCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSLog(@"%@", [[tableContents valueForKey:[sortedKeys objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row]);
    
    UIAlertView *newAwesomeAlert = [[UIAlertView alloc]initWithTitle:[sortedKeys objectAtIndex:indexPath.section]
                                                             message:[[tableContents valueForKey:[sortedKeys objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row]
                                                            delegate:nil
                                                   cancelButtonTitle:@"Dismiss"
                                                   otherButtonTitles:nil, nil];
    [newAwesomeAlert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
