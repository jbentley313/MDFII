//
//  ViewController.m
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionView.h"
#import "DetailsViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self getTimeLine];
//    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



-(void)getTimeLine;
{
    //accountStore
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
        //display loading alert
//        [self DisplayAlertWithString];
        
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
                            
                            //Rest call for user friends list
                            NSString *friendListString =  @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";


                            
                            //SLRequest
                            SLRequest *slRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:friendListString] parameters:nil];
                            
                            if (slRequest != nil) {
                                
                                //1.1 Api requires a user to be logged in
                                [slRequest setAccount:currentAccount];
                                
                                [slRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                    
                                    //get response code
                                    NSInteger responseCode = [urlResponse statusCode];
                                    
                                    if (responseCode == 200) {
                                        
                                        //json object response data
                                        
                                        
                                        twitterJSON = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                        NSLog(@"%@", twitterJSON);
                                        
                                        twitterFeed = (NSDictionary *) [twitterJSON objectForKey:@"users"];
                                        
                                        //reload tableview
                                        [theCollectionView reloadData];
                                        
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







//load cells
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CustomCollectionView *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCelli" forIndexPath:indexPath];
    
    if (cell != nil) {
        
    }
    return cell;
}


//cell sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
   
    return 1;
    
}


//number of collectionview cells
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    if (twitterFeed != nil) {
        
        return twitterFeed.count;
        
    }
    
    return 0;
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
