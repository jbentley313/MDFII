//
//  TweetDetail.h
//  project1
//
//  Created by theOwner on 7/9/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetDetail : NSObject
{
    
}

-(id)initWithText:(NSString*)text timePosted:(NSString*)timePosted userName:(NSString*)userName thumbPictureUrl:(NSString*)thumbPictureUrl;

@property NSString *name;
@property NSString *timeP;
@property NSString *thumbPicUrl;

@end
