//
//  MoviePlayerViewController.h
//  project4
//
//  Created by theOwner on 7/31/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MovieInfo.h"

@interface MoviePlayerViewController : ViewController
{
    MPMoviePlayerController *moviePlayer;
    IBOutlet UIView *movieView;
}

@property MovieInfo *passedMovieDetail;

-(IBAction)onStop:(id)sender;
-(IBAction)onPlay:(id)sender;



@end
