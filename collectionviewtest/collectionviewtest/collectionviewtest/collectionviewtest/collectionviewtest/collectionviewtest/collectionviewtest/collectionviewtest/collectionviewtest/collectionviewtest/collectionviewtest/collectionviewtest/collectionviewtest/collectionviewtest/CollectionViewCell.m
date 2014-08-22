//
//  CollectionViewCell.m
//  collectionviewtest
//
//  Created by Vijay Sridhar on 7/30/14.
//  Copyright (c) 2014 augmentapps. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 320, 40)];
        UIImageView *questionMark = [[UIImageView alloc] initWithFrame:CGRectMake(270, 10, 32, 32)];
        questionMark.image = [UIImage imageNamed:@"question"];
        [self addSubview:questionMark];
        [self setShadow];
        // Initialization code
    }
    return self;
}

- (void)setShadow {
    CALayer *layer = [self layer];
    [layer setShadowOffset:CGSizeMake(1, 1)];
    [layer setShadowRadius:4.0];
    [layer setShadowColor:[UIColor darkGrayColor].CGColor] ;
    [layer setShadowOpacity:0.3];
    [layer setShadowPath:[[UIBezierPath bezierPathWithRect:self.bounds] CGPath]];
}

@end
