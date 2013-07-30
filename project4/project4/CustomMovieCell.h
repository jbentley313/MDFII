//
//  CustomMovieCell.h
//  project4
//
//  Created by theOwner on 7/29/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMovieCell : UITableViewCell
{
    IBOutlet UILabel *movieTitleLabel;
    IBOutlet UILabel *movieTimes;
    IBOutlet UIImageView *movieImage;
}

@property UILabel *movieTitleLabel;
@property UILabel *movieTimes;
@property UIImageView *movieImage;

@end
