//
//  DetailsViewController.h
//  project1
//
//  Created by theOwner on 7/10/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"


@interface DetailsViewController : ViewController
{
    NSDictionary *singleTweetDictionary;
    
}
-(IBAction)onClick:(id)sender;

@property NSDictionary *singleTweetDictionary;


@end
