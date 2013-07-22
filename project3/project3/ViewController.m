//
//  ViewController.m
//  project3
//
//  Created by theOwner on 7/21/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import "RollViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize originalImage, croppedImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)onClick:(id)sender;
{
    
    UIButton *button = (UIButton*)sender;
    
    
        if (button.tag == 3) {
            
            UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
            if (pickerController != nil) {
                pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                
                pickerController.delegate = self;
                pickerController.allowsEditing = NO;
                
            }
            [self presentViewController:pickerController animated:YES completion:nil];

        }  else if (button.tag == 1) {
            UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
            if (pickerController != nil) {
                pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                
                pickerController.delegate = self;
                pickerController.allowsEditing = YES;
                
            }
            [self presentViewController:pickerController animated:YES completion:nil];
        }

}






- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImage *croppedImagePass = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (selectedImage != nil) {
        originalImage = selectedImage;
        croppedImage = croppedImagePass;
        NSLog(@"%@", info);
        [self dismissViewControllerAnimated:NO completion:^{[self performSegueWithIdentifier:@"RollViewSeg" sender:info];

        }];
    }
}

//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
//{
//    [self dismissViewControllerAnimated:TRUE completion:nil];
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RollViewSeg"]) {
        RollViewController *rollView = (RollViewController*)segue.destinationViewController;
        rollView.origImage = originalImage;
        rollView.cropImage = croppedImage;

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
