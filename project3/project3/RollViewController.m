//
//  RollViewController.m
//  project3
//
//  Created by theOwner on 7/21/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "RollViewController.h"

@interface RollViewController ()

@end

@implementation RollViewController
@synthesize origImage, cropImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//-(void)viewDidAppear:(BOOL)animated
//{
//       
//    [super viewDidAppear:animated];
//}



- (void)viewDidLoad
{
    origImageView.image = origImage;
    cropImageView.image = cropImage;
    
    //if there is an edited image, hide close button and show other buttons
    if (cropImageView.image != NULL) {
        saveBtn.hidden = NO;
        cancelBtn.hidden = NO;
        closeBtn.hidden = YES;
        
    //if there is NOT an edited image, hide cancel and save, but show close
    } else if (cropImageView.image == NULL) {
        closeBtn.hidden = NO;
        saveBtn.hidden = YES;
        cancelBtn.hidden = YES;
        
    }
    NSLog(@"%@", cropImage);

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//onClick events
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    //close and cancel button
    if (button.tag == 0) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        //save button
    } else if (button.tag == 1) {
        UIImageWriteToSavedPhotosAlbum(origImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        UIImageWriteToSavedPhotosAlbum(cropImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
        [self DisplayAlertWithString:@"Photos saved!"];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil) {
        NSLog(@"Couldn't save image");
    } else {
        NSLog(@"Saved image");
    }
}


//alert
-(void)DisplayAlertWithString:(NSString*)alert
{
    UIAlertView *alertViewMsg = [[UIAlertView alloc] initWithTitle:@"Alert" message:alert delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    if (alertViewMsg != nil) {
        [alertViewMsg show];
    }
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
