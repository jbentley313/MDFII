//
//  TheaterInfo.m
//  project4
//
//  Created by theOwner on 7/28/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "TheaterInfo.h"


@implementation TheaterInfo
@synthesize theaterImage, theaterLoc, theaterName, arrayOfMovies;

-(id)initWithTheaterName:(NSString*)tName tLoc:(NSString*)tLoc tImage:(UIImage*)tImage tMovies:(NSArray*)tMovies;
{
    if (self = [super init]) {
        theaterName = tName;
        theaterLoc = tLoc;
        theaterImage = tImage;
        arrayOfMovies = tMovies;
    }
    
    return self;
}

@end
