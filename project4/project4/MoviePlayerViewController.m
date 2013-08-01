//
//  MoviePlayerViewController.m
//  project4
//
//  Created by theOwner on 7/31/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "MoviePlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MoviePlayerViewController ()

@end

@implementation MoviePlayerViewController
@synthesize passedMovieDetail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}


-(IBAction)onPlay:(id)sender
{
    //movie trailer
    NSURL *fileUrl = [NSURL URLWithString:passedMovieDetail.movieTrailerLink];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:fileUrl];
    
    
    if (moviePlayer != nil) {
        
        
//        moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, movieSubPlay.frame.size.width , movieSubPlay.frame.size.height);
        
        moviePlayer.view.frame = movieSubPlay.frame;
        [movieSubPlay addSubview:moviePlayer.view];
        
        moviePlayer.fullscreen = false;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
    [moviePlayer play];
    }
}

-(IBAction)onStop:(id)sender
{
    [moviePlayer stop];
}

-(IBAction)onBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
