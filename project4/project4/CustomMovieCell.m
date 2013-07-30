//
//  CustomMovieCell.m
//  project4
//
//  Created by theOwner on 7/29/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "CustomMovieCell.h"

@implementation CustomMovieCell
@synthesize movieImage, movieTimes, movieTitleLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
