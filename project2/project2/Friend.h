//
//  Friend.h
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject
{
    NSString *name;
    NSString *pictureUrl;
}

@property NSString *name;
@property NSString *pictureUrl;

-(id)initWithName:(NSString*)friendName  picUrl:(NSString*)picUrl;

@end
