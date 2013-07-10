//
//  ViewController.h
//  project1
//
//  Created by theOwner on 7/8/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *twitterTableView;
}
@end
