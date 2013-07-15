//
//  ViewController.m
//  project1
//
//  Created by theOwner on 7/8/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "CustomCell.h"
#import "DetailsViewController.h"
#import "UserViewController.h"




@interface ViewController ()

@end

@implementation ViewController
@synthesize objects;

- (void)viewDidLoad
{
    
    //call getTimeLine for Twitter feed
    [self getTimeLine];
    
    //create two navbar buttons for right side of navbar
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshTweets:)];
    NSLog(@"view");
    
    UIBarButtonItem *composeTweets = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(composeTweet:)];
    
    //array of buttons
    NSArray *rightsideNavBarButtons = [[NSArray alloc] initWithObjects:composeTweets, refresh, nil];
    
    //add rightside buttons
    self.navigationItem.rightBarButtonItems = rightsideNavBarButtons;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



-(void)getTimeLine;
{
    //accountStore
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
        //display loading alert
        [self DisplayAlertWithString];
        
        //account type
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted)
                {
                    
                    //array of accounts
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil) {
                        
                        //AcAcount
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil) {
                            
                            //Rest call for user timeline
                            NSString *userTimeString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            //SLRequest
                            SLRequest *slRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userTimeString] parameters:nil];
                            
                            if (slRequest != nil) {
                                
                                //1.1 Api requires a user to be logged in
                                [slRequest setAccount:currentAccount];
                                
                                [slRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                    
                                    //get response code
                                    NSInteger responseCode = [urlResponse statusCode];
                                    
                                    if (responseCode == 200) {
                                        
                                        //json object response data
                                        twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                        
                                        //reload tableview
                                        [twitterTableView reloadData];
                                        
                                    }
                                    
                                }];
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                else
                {
                    NSLog(@"no twitter account available");
                }
                
            }];
            
        }
        
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (twitterFeed != nil) {
        return [twitterFeed count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
    static NSString *CellIdentifier = @"cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell != nil) {
        NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
        if (tweetDictionary != nil) {
            
            //format the date from twitter
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
            NSDate *date = [dateFormatter dateFromString:[tweetDictionary objectForKey:@"created_at"]];
            [dateFormatter setDateFormat:@"eeee, MMMM d, yyyy 'at' hh:mm a"];
            NSString *formattedDate = [dateFormatter stringFromDate:date];
            
            //set tweetlabel to show the tweet
            cell.tweetLabel.text = (NSString *)[tweetDictionary objectForKey:@"text"];
            
            //set datelabel to show date
            cell.dateLabel.text = (NSString *) formattedDate;
            
            
            //dismiss here?
            [alertViewMsg dismissWithClickedButtonIndex:0 animated:YES];
        }
        
        return cell;
        
    }
    
    return nil;
}




//custom cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 71;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//segue to pass info and display details
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //tweet details segue
    if ([segue.identifier isEqualToString:@"detailsSeg"]) {
        
        alertViewMsg = nil;
        
        NSInteger row = [twitterTableView.indexPathForSelectedRow row];
        NSDictionary *tweetSelected = [twitterFeed objectAtIndex:row];
        
        DetailsViewController *tweetDetailViewController = (DetailsViewController *)segue.destinationViewController;
        
        
        //set the tweetObject Dictionary to selected tweet
        tweetDetailViewController.tweetObject = tweetSelected;
        
        
        //user info segue
    } else if ([segue.identifier isEqualToString:@"userInfoSeg"]) {
        
        UserViewController *userView = (UserViewController *)segue.destinationViewController;
        
        //set the userObject Dictionary to first index to get all info
        userView.userObject = [twitterFeed objectAtIndex:0];
        
    }
    
    
}

//refresh
- (void)refreshTweets:(id)sender {
    [self getTimeLine];
}

//swipe down refresh
- (IBAction)pullDown:(id)sender {
    [self getTimeLine];
    NSLog(@"yes");
    
}

//compose tweet
- (void)composeTweet:(id)sender {
    SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if (slComposeViewController != nil) {
        NSLog(@"sl");
        
        [slComposeViewController setInitialText:@"Posted from"];
        
        [self presentViewController:slComposeViewController animated:YES completion:nil];
    }
    
}


//alert
-(void)DisplayAlertWithString
{
    alertViewMsg = [[UIAlertView alloc] initWithTitle:@"Loading" message:@"Please wait..." delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    if (alertViewMsg != nil) {
        
        [alertViewMsg show];
        
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        
        if (indicator  != nil) {
            
            indicator.center = CGPointMake((alertViewMsg.bounds.size.width/2.0f), (alertViewMsg.bounds.size.height/2.0f) + 25.0f);
            
            [indicator startAnimating];
            [alertViewMsg addSubview:indicator];
            
        }
    }
}



@end



