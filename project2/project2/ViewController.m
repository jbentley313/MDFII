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
//#import "Friend.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize FriendObj, objectsWithFriends, friendName, friendPic;

- (void)viewDidLoad
{
    [self getTimeLine];
    [super viewDidLoad];
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
                                        twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                        NSLog(@"%@", twitterFeed);
                                        
                                        //get a dictionary within a twitter dictionary!
                                        tweetArrayy = (NSArray *)[twitterFeed objectForKey:@"users"];
                                        
                                        //alloc and init the Friend custom object
                                        self.objectsWithFriends = [[NSMutableArray alloc] init];
                                        
                                        //loop through tweetarrayy
                                        for (int i = 0; i < tweetArrayy.count; i++) {
                                            
                                            //create dictionary from nsarray from JSON
                                            myFollower = [tweetArrayy objectAtIndex:i];
                                            
                                            //get string for each name object
                                            self.FriendObj = [[Friend alloc] init];
                                            friendName = [myFollower objectForKey:@"screen_name"];
                                            
                                            //get string for pic url
                                            friendPic = [myFollower objectForKey:@"profile_image_url_https"];
                                            
                                            
                                            //set namer from nsstring
                                            FriendObj.namer = self.friendName;
                                            
                                            //set pictureUrl from nsstring
                                            FriendObj.pictureUrl = self.friendPic;
                                            
                                            //add Dictionary to custom object Friend
                                            [self.objectsWithFriends addObject:FriendObj];

                                        }
                                        
                                        //reload tableview
                                        [theCollectionView reloadData];
                                        
                                    }
                                    
                                }];
                                
                            }
                            
                        }

                    }
                    
                }
                
              //if access not granted alert
             else if (! granted)
             {
                 NSString *message = @"No Twitter account associated with this phone.";
                 [self DisplayAlertWithString:message];
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
        Friend *passedFriend = [objectsWithFriends objectAtIndex:indexPath.row];
        
        //display screen name with the '@' symbol at the beginning
        cell.collectionCellName.text =[NSString stringWithFormat:@"@%@", passedFriend.namer];
        ;
        //set cell thumb pics
        NSURL * imageURL = [NSURL URLWithString:passedFriend.pictureUrl];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * image = [UIImage imageWithData:imageData];
        
        cell.collectionCellImage.image = image;
        
        
        
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
    if (tweetArrayy != nil) {
        
        return tweetArrayy.count;
        
    }
    
    return 0;
}

//segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailsSeg"]) {
        UICollectionViewCell *cell = (UICollectionViewCell *)sender;
        NSIndexPath *indexPath = [theCollectionView indexPathForCell:cell ];
        Friend *friendSelected = [objectsWithFriends objectAtIndex:indexPath.row];
        
        DetailsViewController *detail = (DetailsViewController *)segue.destinationViewController;
        
        //pass the friend object to detailsviewcontroller
        detail.friendDetailsObject = friendSelected;
        
        
        
    }
}

//alert
-(void)DisplayAlertWithString:(NSString*)alert
{
    UIAlertView *alertViewMsg = [[UIAlertView alloc] initWithTitle:@"Alert" message:alert delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    if (alertViewMsg != nil) {
        [alertViewMsg show];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
