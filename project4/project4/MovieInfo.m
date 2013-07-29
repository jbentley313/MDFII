//
//  MovieInfo.m
//  project4
//
//  Created by theOwner on 7/28/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "MovieInfo.h"

@implementation MovieInfo
@synthesize movieImage, movieName, movieTimes;




-(id)initWithMovieName:(NSString*)mName mImage:(NSString*)mImage mTimes:(NSArray*)mTimes;
{
    if (self = [super init]) {
        movieName = mName;
        movieImage = mImage;
        movieTimes = mTimes;

    }
    return self;
}

@end
