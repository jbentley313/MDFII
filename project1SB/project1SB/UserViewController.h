//
//  UserViewController.h
//  project1SB
//
//  Created by theOwner on 7/11/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"

@interface UserViewController : ViewController
{
    
}



@property IBOutlet UILabel *userName;
@property IBOutlet UILabel *description;
@property IBOutlet UILabel *followers;
@property IBOutlet UILabel *following;
@property NSDictionary *userObject;


@end
