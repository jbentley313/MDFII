//
//  DetailsViewController.h
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

@interface DetailsViewController : UIViewController
{

}

@property IBOutlet UILabel *nameFriend;
@property IBOutlet UILabel *pic;


@property(strong) Friend *friendDetailsObject;


-(IBAction)onClick:(id)sender;

@end
