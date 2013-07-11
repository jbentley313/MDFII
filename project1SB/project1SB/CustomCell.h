//
//  CustomCell.h
//  project1SB
//
//  Created by theOwner on 7/10/13.
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
@property (nonatomic, strong) UIImageView *icon;

@end
