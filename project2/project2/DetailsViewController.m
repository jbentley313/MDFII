//
//  DetailsViewController.m
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DetailsViewController.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController

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
	// Do any additional setup after loading the view.
}

-(IBAction)onClick:(id)sender;
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
