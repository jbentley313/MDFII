//
//  DetailsViewController.m
//  project1SB
//
//  Created by theOwner on 7/10/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize tweetObject, textLabel, passedText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//added this just to get rid of alertview that is firing seemingly by itself when a cell is selected
-(void)viewWillAppear:(BOOL)animated
{
    [alertViewMsg dismissWithClickedButtonIndex:0 animated:YES];
}


//-(void)viewDidAppear:(BOOL)animated
//{
//    [alertViewMsg dismissWithClickedButtonIndex:0 animated:YES];
//}

- (void)viewDidLoad
{
    
   //set the textlabel to show tweet
    textLabel.text = (NSString *)[tweetObject objectForKey:@"text"];
    
    //format the date coming from twitter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSDate *date = [dateFormatter dateFromString:[tweetObject objectForKey:@"created_at"]];
    [dateFormatter setDateFormat:@"eeee, MMMM d, yyyy 'at' hh:mm a"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    //date label
    datePosted.text = formattedDate;
    
    //name label
    userLabel.text = (NSString *)[[tweetObject objectForKey:@"user"] objectForKey:@"name"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
