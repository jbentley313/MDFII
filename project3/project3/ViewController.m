//
//  ViewController.m
//  project3
//
//  Created by theOwner on 7/21/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import "RollViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize originalImage, croppedImage;

- (void)viewDidLoad
{
    [self animateGlow];
     
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


//click events
-(IBAction)onClick:(id)sender;
{
    
    UIButton *button = (UIButton*)sender;
    
    //photo library picker
    if (button.tag == 3) {
        
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        if (pickerController != nil) {
            pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            pickerController.delegate = self;
            pickerController.allowsEditing = NO;
            
        }
        [self presentViewController:pickerController animated:YES completion:nil];
        
        //camera picker
    }  else if (button.tag == 1) {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        if (pickerController != nil) {
            pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            pickerController.delegate = self;
            pickerController.allowsEditing = YES;
            
        }
        //present picker
        [self presentViewController:pickerController animated:YES completion:nil];
    } else if (button.tag ==2) {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        if (pickerController != nil) {
            pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            pickerController.delegate = self;
            pickerController.allowsEditing = NO;
            pickerController.videoQuality = UIImagePickerControllerQualityTypeMedium;
            
            pickerController.mediaTypes = [NSArray arrayWithObjects:(NSString*) kUTTypeMovie, nil];
            [self presentViewController:pickerController animated:YES completion:nil];
        }
    }
}





//picked image
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImage *croppedImagePass = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    NSURL *urlString = [info valueForKey:UIImagePickerControllerMediaURL];
    
    if (selectedImage != nil) {
        originalImage = selectedImage;
        croppedImage = croppedImagePass;
        //        NSLog(@"%@", info);
        [self dismissViewControllerAnimated:NO completion:^{[self performSegueWithIdentifier:@"RollViewSeg" sender:info];
            
        }];
    } else if (urlString !=nil) {
        NSString *videoPath = [urlString path];
        
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
}


- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    if (error != nil) {
        NSLog(@"Error Saving File!");
    } else {
        [self DisplayAlertWithString:@"Video Saved!"];
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
//{
//    [self dismissViewControllerAnimated:TRUE completion:nil];
//}


//segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RollViewSeg"]) {
        RollViewController *rollView = (RollViewController*)segue.destinationViewController;
        rollView.origImage = originalImage;
        rollView.cropImage = croppedImage;
        
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


//animation experiment 
-(void)animateGlow
{
    theAnimationCam = [[CABasicAnimation alloc]init];
    theAnimationCam=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimationCam.duration=.7;
    theAnimationCam.beginTime=0;
    theAnimationCam.repeatCount=1;
    theAnimationCam.autoreverses=YES;
    theAnimationCam.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimationCam.toValue=[NSNumber numberWithFloat:0.0];
    
    [cam.layer addAnimation:theAnimationCam forKey:@"animateOpacity"];
    [camLab.layer addAnimation:theAnimationCam forKey:@"animateOpacity"];
    
    theAnimationFilm = [[CABasicAnimation alloc] init];
    theAnimationFilm=[CABasicAnimation animationWithKeyPath:@"opacity"];
    [theAnimationFilm setDuration:.7];
    [theAnimationFilm setBeginTime:CACurrentMediaTime()+2];
    theAnimationFilm.repeatCount=1;
    theAnimationFilm.autoreverses=YES;
    theAnimationFilm.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimationFilm.toValue=[NSNumber numberWithFloat:0.0];
    
    
    [film.layer addAnimation:theAnimationFilm forKey:@"animateOpacity"];
    [filmLab.layer addAnimation:theAnimationFilm forKey:@"animateOpacity"];

    
    theAnimationRoll = [[CABasicAnimation alloc] init];
    theAnimationRoll=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimationRoll.duration=.7;
    [theAnimationRoll setBeginTime:CACurrentMediaTime()+4];
    theAnimationRoll.repeatCount=1;
    theAnimationRoll.autoreverses=YES;
    theAnimationRoll.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimationRoll.toValue=[NSNumber numberWithFloat:0.0];
    

    [roll.layer addAnimation:theAnimationRoll forKey:@"animateOpacity"];
    [rollLab.layer addAnimation:theAnimationRoll forKey:@"animateOpacity"];
    
        
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
