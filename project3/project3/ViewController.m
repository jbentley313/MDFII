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
@synthesize originalImage;

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
            [self presentViewController:pickerController animated:YES completion:Nil];

        }

}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage != nil) {
        originalImage = selectedImage;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
//{
//    
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
