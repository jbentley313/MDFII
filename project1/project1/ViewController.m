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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //accountStore
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
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
                                            NSLog(@"%@", [twitterFeed description]);
                                            
                                            
                                        
                                        
                                    }
                                    
                                }];
                            }
                            
                        }
                        
                        
                    }
                    
                }
                else
                {
                    
                }
            }];
                                                                                               
        }
    }
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:self options:nil];
    
    CustomCell *cell = (CustomCell *) [nib objectAtIndex:0];
    
    if (cell != nil) {
        NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
        if (tweetDictionary != nil) {
                        
            cell.tweetLabel.text = (NSString *)[tweetDictionary objectForKey:@"text"];
            cell.dateLabel.text = (NSString *)[tweetDictionary objectForKey:@"created_at"];
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



@end
