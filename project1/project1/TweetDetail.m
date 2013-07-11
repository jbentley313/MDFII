//
//  TweetDetail.m
//  project1
//
//  Created by theOwner on 7/9/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "TweetDetail.h"

@implementation TweetDetail
@synthesize name, timeP, thumbPicUrl;


-(id)initWithText:(NSString*)text timePosted:(NSString*)timePosted userName:(NSString*)userName thumbPictureUrl:(NSString*)thumbPictureUrl
{
    if ((self = [super init]))
    {
        name = userName;
        timeP = timePosted;
        thumbPicUrl = thumbPictureUrl;
    }
    return self;
}

@end
