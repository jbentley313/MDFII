//
//  UserViewController.m
//  project1SB
//
//  Created by theOwner on 7/11/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController
@synthesize userName, description, followers, following, userObject;


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
    //set userName label
    userName.text = (NSString *)[[userObject objectForKey:@"user"] objectForKey:@"name"];
    description.text = (NSString *)[[userObject objectForKey:@"user"] objectForKey:@"description"];
    
    //get int value from a string within a dictionary!
    int followersInt = [[(NSDictionary *) [userObject objectForKey:@"user"] objectForKey:@"followers_count"]integerValue];
    
    //set followers label
    followers.text = [NSString stringWithFormat:@"%i", followersInt];
    
    //set following (friends) label
    int followingInt = [[(NSDictionary *) [userObject objectForKey:@"user"] objectForKey:@"friends_count"]integerValue];
    following.text = [NSString stringWithFormat:@"%i", followingInt];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
