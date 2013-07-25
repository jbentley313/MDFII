//
//  ViewController.h
//  project3
//
//  Created by theOwner on 7/21/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIButton *cam;
    IBOutlet UIButton *film;
    IBOutlet UIButton *roll;
    IBOutlet UILabel *camLab;
    IBOutlet UILabel *filmLab;
    IBOutlet UILabel *rollLab;
    CABasicAnimation *theAnimationCam;
    CABasicAnimation *theAnimationFilm;
    CABasicAnimation *theAnimationRoll;
}
-(IBAction)onClick:(id)sender;
@property UIImage *originalImage;
@property UIImage *croppedImage;

@end
