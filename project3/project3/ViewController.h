//
//  ViewController.h
//  project3
//
//  Created by theOwner on 7/21/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    
}
-(IBAction)onClick:(id)sender;
@property UIImage *originalImage;
@property UIImage *croppedImage;

@end
