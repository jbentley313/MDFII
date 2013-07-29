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

@interface ViewController ()

@end

@implementation ViewController
@synthesize theaterArray, movieArray;

- (void)viewDidLoad
{
    
    
    
    

    
    MovieInfo *Movie1 = [[MovieInfo alloc] initWithMovieName:@"Touching the Void" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"6:00pm", @"7:00pm", @"8:20pm",nil]];
    MovieInfo *Movie2 = [[MovieInfo alloc] initWithMovieName:@"The Dictator" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"6:30pm", @"7:30pm", @"9:20pm",nil]];
    MovieInfo *Movie3 = [[MovieInfo alloc] initWithMovieName:@"Rock Star" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"5:00pm", @"6:00pm", @"7:40pm",nil]];
    MovieInfo *Movie4 = [[MovieInfo alloc] initWithMovieName:@"Studio Life" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"4:00pm", @"7:20pm", @"9:25pm",nil]];
    MovieInfo *Movie5 = [[MovieInfo alloc] initWithMovieName:@"Autotune Massacre" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"6:00pm", @"6:20pm", @"10:20pm",nil]];
    MovieInfo *Movie6 = [[MovieInfo alloc] initWithMovieName:@"You Can't Sing!" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"12:00pm", @"7:25pm", @"8:00pm",nil]];
    MovieInfo *Movie7 = [[MovieInfo alloc] initWithMovieName:@"Dancing With the Nerds" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"12:10pm", @"3:00pm", @"4:20pm",nil]];
    MovieInfo *Movie8 = [[MovieInfo alloc] initWithMovieName:@"Crazy Crazy Movie" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"12:15", @"1:00pm", @"8:10pm",nil]];
    MovieInfo *Movie9 = [[MovieInfo alloc] initWithMovieName:@"The Most Boring Movie" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"12:30pm", @"2:00pm", @"8:15pm",nil]];
    MovieInfo *Movie10 = [[MovieInfo alloc] initWithMovieName:@"Racecars!" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"11:00am", @"4:10pm", @"6:20pm",nil]];
    MovieInfo *Movie11 = [[MovieInfo alloc] initWithMovieName:@"Xcode is Better!" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"6:40pm", @"7:00pm", @"9:20pm",nil]];
    MovieInfo *Movie12 = [[MovieInfo alloc] initWithMovieName:@"Who Codes with Java?" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"6:45pm", @"7:05pm", @"9:35pm",nil]];
    MovieInfo *Movie13 = [[MovieInfo alloc] initWithMovieName:@"Console Dot Logging" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"6:50pm", @"7:35pm", @"8:20pm",nil]];
    MovieInfo *Movie14 = [[MovieInfo alloc] initWithMovieName:@"Java's Script" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"6:550pm", @"7:20pm", @"8:25pm",nil]];
    MovieInfo *Movie15 = [[MovieInfo alloc] initWithMovieName:@"We are Movie Fifteen" mImage:@"img" mTimes:[NSArray arrayWithObjects:@"4:50pm", @"7:00pm", @"8:50pm",nil]];
    
    movieArray = [[NSArray alloc] initWithObjects:Movie1, Movie2, Movie3, Movie4, Movie5, Movie6, Movie7, Movie8, Movie9, Movie10, Movie11, Movie12, Movie13, Movie14, Movie15, nil];
    
    TheaterInfo *Theater1 = [[TheaterInfo alloc] initWithTheaterName:@"Loews Hollywood" tLoc:@"Hollywood" tImage:nil tMovies:[NSArray arrayWithObjects:Movie1, Movie2, Movie3, Movie4, Movie5, nil] ];
    
    TheaterInfo *Theater2 = [[TheaterInfo alloc] initWithTheaterName:@"Loews West Hollywood" tLoc:@"West Hollywood" tImage:nil tMovies:[NSArray arrayWithObjects:Movie6, Movie7, Movie8, Movie9, Movie10, nil] ];
    
    TheaterInfo *Theater3 = [[TheaterInfo alloc] initWithTheaterName:@"Arclight" tLoc:@"Hollywood" tImage:nil tMovies:[NSArray arrayWithObjects:Movie11, Movie12, Movie13, Movie14, Movie15, nil] ];
    
    theaterArray = [[NSArray alloc] initWithObjects:Theater1, Theater2, Theater3, nil];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (section == 0)
    {
        return 3;
    }
    else if (section == 1)
    {
        return 4;
    }
    else if (section == 2)
    {
        return 5;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"movieCell"];
    
//    TheaterInfo *passed = [theaterArray objectAtIndex:indexPath.row];
//    
    //set cell text
//    cell.textLabel.text = passed.theaterName;
    
    cell.textLabel.text = @"this is a tablecell";
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.theaterArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, movieTableView.frame.size.width, 30.0f)];
// 
//    return headerLabel.text;
    if (section == 0) {
        return [self.theaterArray objectAtIndex:section];
    }
    return nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
