//
//  Tweet.h
//  project1SB
//
//  Created by theOwner on 7/10/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject
{
     NSString *name;
     NSString *timeP;
     NSString *thumbPicUrl;
}
-(id)initWithText:(NSString*)text timePosted:(NSString*)timePosted userName:(NSString*)userName thumbPictureUrl:(NSString*)thumbPictureUrl;

@property NSString *name;
@property NSString *timeP;
@property NSString *thumbPicUrl;

@end
