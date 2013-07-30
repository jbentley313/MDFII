//
//  ViewController.h
//  project4
//
//  Created by theOwner on 7/28/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheaterInfo.h"


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *movieTableView;
    NSArray *theaterArray;
    NSArray *movieArray;
    
}

@property NSArray *theaterArray;
@property NSArray *movieArray;



@end
