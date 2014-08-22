//
//  CollectionViewCell.h
//  collectionviewtest
//
//  Created by Vijay Sridhar on 7/30/14.
//  Copyright (c) 2014 augmentapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, retain) IBOutlet UILabel *label;

- (void)setShadow;
@end
