//
//  RollViewController.h
//  project3
//
//  Created by theOwner on 7/21/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RollViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIImageView *origImageView;
    IBOutlet UIImageView *cropImageView;
    IBOutlet UIButton *cancelBtn;
    IBOutlet UIButton *saveBtn;
    IBOutlet UIButton *closeBtn;
}

@property UIImage *origImage;
@property UIImage *cropImage;
-(IBAction)onClick:(id)sender;
@end
