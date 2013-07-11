//
//  ViewController.h
//  project1SB
//
//  Created by theOwner on 7/10/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "Tweet.h"
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *twitterTableView;
    NSDateFormatter *formattedDate;
    NSArray *twitterFeed;
    NSArray *info;
    NSMutableArray *objects;
}

-(IBAction)onClick:(id)sender;

@property NSMutableArray *objects;

@property NSString *textToPass;

@end
