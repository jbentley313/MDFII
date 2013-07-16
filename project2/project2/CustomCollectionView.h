//
//  CustomCollectionView.h
//  project2
//
//  Created by theOwner on 7/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionView : UICollectionViewCell
{
    IBOutlet UIImageView *collectionCellImage;
    IBOutlet UILabel *collectionCellName;
}

@property UILabel *collectionCellName;
@end
