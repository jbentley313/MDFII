//
//  CustomCell.h
//  project1
//
//  Created by theOwner on 7/9/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *dateLabel;
}

@property (nonatomic, strong)  UILabel *tweetLabel;
@property (nonatomic, strong) UILabel *dateLabel;

@end
