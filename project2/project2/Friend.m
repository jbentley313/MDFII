//
//  Friend.m
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "Friend.h"

@implementation Friend
@synthesize pictureUrl, name;



-(id)initWithName:(NSString*)friendName  picUrl:(NSString*)picUrl;
{

if ((self = [super init]))
{
    friendName = name;
    picUrl = pictureUrl;
}
    return self;
}
@end
