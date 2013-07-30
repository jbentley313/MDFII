//
//  ViewController.m
//  project4
//
//  Created by theOwner on 7/28/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import "TheaterInfo.h"
#import "MovieInfo.h"
#import "CustomMovieCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize theaterArray, movieArray;

- (void)viewDidLoad
{
    
    
    
    
    
    //movie info
    MovieInfo *Movie1 = [[MovieInfo alloc] initWithMovieName:@"Touching the Void" mImage:@"ttvoid.png" mTimes:[NSArray arrayWithObjects:@" 6:00pm ", @" 7:00pm ", @" 8:20pm ",nil]];
    MovieInfo *Movie2 = [[MovieInfo alloc] initWithMovieName:@"The Avengers" mImage:@"avg.png" mTimes:[NSArray arrayWithObjects:@" 6:30pm ", @" 7:30pm ", @" 9:20pm ",nil]];
    MovieInfo *Movie3 = [[MovieInfo alloc] initWithMovieName:@"Star Trek" mImage:@"trek.png" mTimes:[NSArray arrayWithObjects:@" 5:00pm ", @" 6:00pm ", @" 7:40pm ",nil]];
    MovieInfo *Movie4 = [[MovieInfo alloc] initWithMovieName:@"Monster's University" mImage:@"monstuniv.png" mTimes:[NSArray arrayWithObjects:@" 4:00pm ", @" 7:20pm ", @" 9:25pm ",nil]];
    MovieInfo *Movie5 = [[MovieInfo alloc] initWithMovieName:@"Arthur Newman" mImage:@"arthur.png" mTimes:[NSArray arrayWithObjects:@" 6:00pm ", @" 6:20pm ", @" 10:20pm ",nil]];
    MovieInfo *Movie6 = [[MovieInfo alloc] initWithMovieName:@"The Hangover III" mImage:@"hang3.png" mTimes:[NSArray arrayWithObjects:@" 12:00pm ", @" 7:25pm ", @" 8:00pm ",nil]];
    MovieInfo *Movie7 = [[MovieInfo alloc] initWithMovieName:@"Prometheus" mImage:@"prom.png" mTimes:[NSArray arrayWithObjects:@" 12:10pm ", @" 3:00pm ", @" 4:20pm ",nil]];
    MovieInfo *Movie8 = [[MovieInfo alloc] initWithMovieName:@"A Good Day to Die Hard" mImage:@"diehard.png" mTimes:[NSArray arrayWithObjects:@" 12:15pm ", @" 1:00pm ", @" 8:10pm ",nil]];
    MovieInfo *Movie9 = [[MovieInfo alloc] initWithMovieName:@"The Lone Ranger" mImage:@"ranger.png" mTimes:[NSArray arrayWithObjects:@" 12:30pm ", @" 2:00pm ", @" 8:15pm ",nil]];
    MovieInfo *Movie10 = [[MovieInfo alloc] initWithMovieName:@"World War Z" mImage:@"wwz.png" mTimes:[NSArray arrayWithObjects:@" 11:00am ", @" 4:10pm ", @" 6:20pm ",nil]];
    MovieInfo *Movie11 = [[MovieInfo alloc] initWithMovieName:@"Pacific Rim" mImage:@"pacrim.png" mTimes:[NSArray arrayWithObjects:@" 6:40pm ", @" 7:00pm ", @" 9:20pm ",nil]];
    MovieInfo *Movie12 = [[MovieInfo alloc] initWithMovieName:@"The Wolverine" mImage:@"wolv.png" mTimes:[NSArray arrayWithObjects:@" 6:45pm ", @" 7:05pm ", @" 9:35pm ",nil]];
    MovieInfo *Movie13 = [[MovieInfo alloc] initWithMovieName:@"Man of Steel" mImage:@"steel.png" mTimes:[NSArray arrayWithObjects:@" 6:50pm ", @" 7:35pm ", @" 8:20pm ",nil]];
    MovieInfo *Movie14 = [[MovieInfo alloc] initWithMovieName:@"Iron Man 3" mImage:@"im3.png" mTimes:[NSArray arrayWithObjects:@" 6:550pm ", @" 7:20pm ", @" 8:25pm ",nil]];
    MovieInfo *Movie15 = [[MovieInfo alloc] initWithMovieName:@"The Dark Knight Rises" mImage:@"darknight.png" mTimes:[NSArray arrayWithObjects:@" 4:50pm ", @" 7:00pm ", @" 8:50pm ",nil]];
    
    //array of movies
    movieArray = [[NSArray alloc] initWithObjects:Movie1, Movie2, Movie3, Movie4, Movie5, Movie6, Movie7, Movie8, Movie9, Movie10, Movie11, Movie12, Movie13, Movie14, Movie15, nil];
    
    //theater info
    TheaterInfo *Theater1 = [[TheaterInfo alloc] initWithTheaterName:@"Loews AMC" tLoc:@"Santa Monica" tImage:nil tMovies:[NSArray arrayWithObjects:Movie1, Movie2, Movie3, Movie4, Movie5, nil] ];
    
    TheaterInfo *Theater2 = [[TheaterInfo alloc] initWithTheaterName:@"El Capitan" tLoc:@"Los Angeles" tImage:nil tMovies:[NSArray arrayWithObjects:Movie6, Movie7, Movie8, Movie9, Movie10, nil] ];
    
    TheaterInfo *Theater3 = [[TheaterInfo alloc] initWithTheaterName:@"Arclight" tLoc:@"Hollywood" tImage:nil tMovies:[NSArray arrayWithObjects:Movie11, Movie12, Movie13, Movie14, Movie15, nil] ];
    
    //theater array
    theaterArray = [[NSArray alloc] initWithObjects:Theater1, Theater2, Theater3, nil];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}




//load cells ***********************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    static NSString *CellIdentifier = @"movieCell";
    
    CustomMovieCell *cell = [movieTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    TheaterInfo *passedTheater = [theaterArray objectAtIndex:indexPath.section];
    
    NSString *movieTitle = [[passedTheater.arrayOfMovies objectAtIndex:indexPath.row] movieName];
    NSArray *movieTimes = [[passedTheater.arrayOfMovies objectAtIndex:indexPath.row] movieTimes];
    NSString *movieImgString = [[passedTheater.arrayOfMovies objectAtIndex:indexPath.row] movieImage];
    UIImage *movieImg = [UIImage imageNamed:movieImgString];
    
    NSMutableString * result = [[NSMutableString alloc] init];
    for (NSObject * movieTimeObjs in movieTimes)
    {
        [result appendString:[movieTimeObjs description]];
    }
    
    
    //set cell text
    cell.movieTitleLabel.text = movieTitle;
    cell.movieTimes.text =  [NSString stringWithFormat:@"%@  ", result] ;
    cell.movieImage.image = movieImg;
    
    return cell;
}



//number of sections ***********
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [theaterArray count];
    
}


//number of rows in each section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    return [[[self.theaterArray objectAtIndex:section] arrayOfMovies ] count];
    
}


//title for header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, movieTableView.frame.size.width, 30.0f)];
    
    headerLabel.text = [[theaterArray objectAtIndex:section] theaterName];
    
    return  headerLabel.text;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
