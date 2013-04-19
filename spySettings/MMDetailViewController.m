//
//  MMDetailViewController.m
//  spySettings
//
//  Created by StopBitingMe on 2/14/13.
//  Copyright (c) 2013 spawrks. All rights reserved.
//

#import "MMDetailViewController.h"

@interface MMDetailViewController ()
{

    __weak IBOutlet UILabel *detailTextLabel;
}

@end

@implementation MMDetailViewController
@synthesize detailString;
@synthesize groupString;

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
    
    self.title = groupString;
    detailTextLabel.text = detailString;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
