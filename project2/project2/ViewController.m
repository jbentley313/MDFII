//
//  ViewController.m
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionView.h"
#import "DetailsViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CustomCollectionView *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCelli" forIndexPath:indexPath];
    
    if (cell != nil) {
        
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    return 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
