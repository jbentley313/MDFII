//
//  Friend.m
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "Friend.h"

@implementation Friend
@synthesize pictureUrl, namer, imgP;



-(id)initWithName:(NSString*)friendName  picUrl:(NSString*)picUrl imgs:(UIImage*)imgs;
{
    
    if ((self = [super init]))
    {
        namer = friendName;
        pictureUrl = picUrl;
        imgP = imgs;
        
    }
    return self;
}
@end
