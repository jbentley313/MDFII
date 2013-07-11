//
//  DetailsViewController.h
//  project1
//
//  Created by theOwner on 7/10/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import "TweetDetail.h"

@interface DetailsViewController : ViewController
{
    NSObject *singleTweet;
    
}
-(IBAction)onClick:(id)sender;

@property (strong) TweetDetail *tweetDetailObject;


@end
