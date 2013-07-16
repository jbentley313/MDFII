//
//  ViewController.h
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    IBOutlet UICollectionView *theCollectionView;
    NSDictionary *twitterJSON;
    NSDictionary *twitterFeed;
    
    NSDictionary *myFollower;
    NSMutableArray *objectsWithFriends;
    NSArray *tweetArrayy;
}

@property(strong) Friend *FriendObj;

@end
