//
//  MovieInfo.h
//  project4
//
//  Created by theOwner on 7/28/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieInfo : NSObject
{
    NSString *movieImage;
    NSString *movieName;
    NSArray *movieTimes;
}

@property(strong, nonatomic) NSString *movieImage;
@property(strong, nonatomic) NSString *movieName;
@property(strong, nonatomic) NSArray *movieTimes;

-(id)initWithMovieName:(NSString*)mName mImage:(NSString*)mImage mTimes:(NSArray*)mTimes;


@end
