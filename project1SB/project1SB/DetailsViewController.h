//
//  DetailsViewController.h
//  project1SB
//
//  Created by theOwner on 7/10/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"

@interface DetailsViewController : ViewController 
{
    NSDictionary *tweetObject;
    IBOutlet UILabel *text;
    IBOutlet UILabel *datePosted;
    
}
@property(strong) IBOutlet UILabel *textLabel;

@property NSDictionary *tweetObject;
@property NSString *passedText;

@end
