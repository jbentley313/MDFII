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
    userName.text = (NSString *)[userObject objectForKey:@"name"] ;
    description.text = (NSString *)[[userObject objectForKey:@"user"] objectForKey:@"description"];
    
    int followersInt = [[(NSDictionary *) [userObject objectForKey:@"user"] objectForKey:@"followers_count"]integerValue];
    
    followers.text = [NSString stringWithFormat:@"%i", followersInt];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
