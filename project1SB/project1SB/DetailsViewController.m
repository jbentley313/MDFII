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

- (void)viewDidLoad
{
    NSLog(@"%@", tweetObject);
    
    textLabel.text = (NSString *)[tweetObject objectForKey:@"text"];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSDate *date = [dateFormatter dateFromString:[tweetObject objectForKey:@"created_at"]];
    [dateFormatter setDateFormat:@"eeee, MMMM d, yyyy 'at' hh:mm a"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    datePosted.text = formattedDate;
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
