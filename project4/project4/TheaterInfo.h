//
//  TheaterInfo.h
//  project4
//
//  Created by theOwner on 7/28/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TheaterInfo : NSObject
{
    NSString *theaterName;
    NSString *theaterLoc;
    UIImage *theaterImage;
    NSArray *arrayOfMovies;
}


@property(strong, nonatomic) NSString *theaterName;
@property(strong, nonatomic) NSString *theaterLoc;
@property(strong, nonatomic) UIImage *theaterImage;
@property(strong, nonatomic) NSArray *arrayOfMovies;

-(id)initWithTheaterName:(NSString*)tName tLoc:(NSString*)tLoc tImage:(UIImage*)tImage tMovies:(NSArray*)tMovies;

@end
