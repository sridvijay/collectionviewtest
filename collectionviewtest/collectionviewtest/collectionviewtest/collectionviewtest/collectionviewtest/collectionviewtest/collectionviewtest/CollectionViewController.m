//
//  CollectionViewController.m
//  collectionviewtest
//
//  Created by Vijay Sridhar on 7/30/14.
//  Copyright (c) 2014 augmentapps. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewController () {
    UICollectionViewFlowLayout *layout, *otherLayout;
    NSIndexPath *indexPathReal;
    int test;
}

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    layout = [[UICollectionViewFlowLayout alloc] init];
    otherLayout = [[UICollectionViewFlowLayout alloc] init];
    otherLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    [otherLayout setSectionInset:UIEdgeInsetsMake(30, 0, 20, 0)];
    layout.itemSize = CGSizeMake(300, 100);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    [layout setSectionInset:UIEdgeInsetsMake(30, 0, 20, 0)];
    [self.collectionView setCollectionViewLayout:layout animated:YES];
    // Register cell classes
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.label.text = @"Loan or Rent?";
    } else {
        cell.label.text = @"Property Value";
    }
    cell.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    [cell.contentView addSubview:cell.label];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionViewLayout == otherLayout) {
        if (indexPath != indexPathReal) {
            CGSize cellSize = (CGSize) { .width = 310, .height = 100 };
            return cellSize;
        } else {
            CGSize cellSize = (CGSize) { .width = 310, .height = 300 };
            return cellSize;
        }
    } else {
        CGSize cellSize = (CGSize) { .width = 310, .height = 100 };
        return cellSize;
    }
    
//    //Return the size of each cell to draw
//    if (test == 0) {
//        CGSize cellSize = (CGSize) { .width = 320, .height = 100 };
//        return cellSize;
//    } else {
//        CGSize cellSize = (CGSize) { .width = 320, .height = 300 };
//        return cellSize;
//    }
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    indexPathReal = indexPath;
    if (collectionView.collectionViewLayout == otherLayout) {
        [collectionView setCollectionViewLayout:layout animated:YES completion:^(BOOL finished) {
        }];
        [((CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath]) setShadow];
    } else {
        [collectionView setCollectionViewLayout:otherLayout animated:YES completion:^(BOOL finished) {
            [((CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath]) setShadow];
        }];
    }

//    [self.collectionView.collectionViewLayout invalidateLayout];
//    [collectionView performBatchUpdates:^{
//        test = 1;
//        [self.collectionView reloadItemsAtIndexPaths:[self.collectionView indexPathsForVisibleItems]];
////        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath]; // Avoid retain cycles
////        void (^animateChangeWidth)() = ^()
////        {
////            CGRect frame = cell.frame;
////            frame.size = CGSizeMake(300, 300);
////            cell.frame = frame;
////        };
////        [UIView transitionWithView:cell duration:0.1f options: UIViewAnimationOptionCurveLinear animations:animateChangeWidth completion:nil];
//    } completion:^(BOOL finished) {
////        [collectionView setCollectionViewLayout:layout animated:YES];
//
//    }];
    return YES;
}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
