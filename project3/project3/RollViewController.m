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


-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0) {
         [self dismissViewControllerAnimated:YES completion:nil];
    } else if (button.tag == 1) {
        
    }
   
}

- (void)viewDidLoad
{
    origImageView.image = origImage;
    cropImageView.image = cropImage;
    
    if (cropImageView.image != NULL) {
        saveBtn.hidden = NO;
        cancelBtn.hidden = NO;
        closeBtn.hidden = YES;
    } else if (cropImageView.image == NULL) {
        closeBtn.hidden = YES;
        saveBtn.hidden = YES;
        cancelBtn.hidden = YES;
        
    }
    NSLog(@"%@", cropImage);

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
