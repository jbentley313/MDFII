//
//  CustomCell.m
//  project1
//
//  Created by theOwner on 7/9/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize tweetLabel, dateLabel, icon;

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
