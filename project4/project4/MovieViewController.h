//
//  MovieViewController.h
//  project4
//
//  Created by theOwner on 7/30/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController : UIViewController 
{
    MPMoviePlayerController *moviePlayer;
    UILabel *movieDetailTitle;
    UILabel *movieDetailTimes;
    UIImageView *movieDetailImage;
    NSURL *fileUrl;
}

-(IBAction)onClick:(id)sender;
-(IBAction)onBack:(id)sender;

@property(strong) MovieInfo *passedMovie;
@property(strong, nonatomic) IBOutlet UILabel *movieDetailTitle;
@property(strong, nonatomic) IBOutlet UILabel *movieDetailTimes;
@property(strong, nonatomic) IBOutlet UIImageView *movieDetailImage;
//@property(strong) MPMoviePlayerController *moviePlayer;

@end
