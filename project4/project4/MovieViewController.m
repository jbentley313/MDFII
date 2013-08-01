//
//  MovieViewController.m
//  project4
//
//  Created by theOwner on 7/30/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "MovieViewController.h"
//#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController ()

@end

@implementation MovieViewController
@synthesize passedMovie, movieDetailImage, movieDetailTimes, movieDetailTitle;

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
    
    movieDetailTitle.text = passedMovie.movieName;
    
    
    
    UIImage *movieImgString = [UIImage imageNamed:passedMovie.movieImage];
    movieDetailImage.image = movieImgString;
    
    
    NSArray *movieTimes = passedMovie.movieTimes;
    NSMutableString * result = [[NSMutableString alloc] init];
    for (NSObject * movieTimeObjs in movieTimes)
    {
        [result appendString:[movieTimeObjs description]];
    }
    
    
    movieDetailTimes.text = result;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(IBAction)onClick:(id)sender;
{
    //movie trailer
    fileUrl = [NSURL URLWithString:passedMovie.movieTrailerLink];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:fileUrl];
    
    if (moviePlayer != nil) {
        [self.view addSubview:moviePlayer.view];
        
        moviePlayer.fullscreen = true;
        [moviePlayer play];
//        [moviePlayer stop];
    }
}

-(IBAction)onBack:(id)sender;
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
