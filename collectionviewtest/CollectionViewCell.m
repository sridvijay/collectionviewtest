//
//  CollectionViewCell.m
//  collectionviewtest
//
//  Created by Vijay Sridhar on 7/30/14.
//  Copyright (c) 2014 augmentapps. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell {
    UIImageView *questionMark;
    UIImageView *button;
    int number;
}

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 320, 40)];
        questionMark = [[UIImageView alloc] initWithFrame:CGRectMake(270, 13, 20, 20)];
        questionMark.image = [UIImage imageNamed:@"questionMark"];
        [self addSubview:questionMark];
        [self setShadow];
        self.clipsToBounds = YES;
        // Initialization code
    }
    return self;
}

- (void)addButton {
    button = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, 320, 40)];
    button.image = [UIImage imageNamed:@"button"];
    button.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:button];
}

- (void)setShadow {
    CALayer *layer = [self layer];
    [layer setShadowOffset:CGSizeMake(1, 1)];
    [layer setShadowRadius:4.0];
    [layer setShadowColor:[UIColor darkGrayColor].CGColor] ;
    [layer setShadowOpacity:0.3];
    [layer setShadowPath:[[UIBezierPath bezierPathWithRect:self.bounds] CGPath]];
}

- (void)flip {
    if (number == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.4 animations:^{
                button.frame = CGRectMake(0, 110, 320, 40);
                number++;
            } completion:^(BOOL finished) {
                [UIView transitionWithView:self
                                  duration:0.4
                                   options:UIViewAnimationOptionTransitionFlipFromRight|UIViewAnimationOptionCurveEaseInOut
                                animations:^{
                                    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 40, 280, 60)];
                                    textView.tag = 133;
                                    textView.text = @"You don't charge someone for a loan, but you do charge if you're renting it to them.";
                                    questionMark.image = [UIImage imageNamed:@"good"];
                                    [self.contentView addSubview:textView];
                                    
                                    number++;
                                } completion:NULL];
            }];
        });
    } else {
        number = 0;
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.6 animations:^{
                [[self.contentView viewWithTag:133] setAlpha:0];
                button.frame = CGRectMake(0, 60, 320, 40);
            } completion:^(BOOL finished) {
                [UIView transitionWithView:self
                                  duration:0.4
                                   options:UIViewAnimationOptionTransitionFlipFromRight|UIViewAnimationOptionCurveEaseInOut
                                animations:^{
                                    questionMark.image = [UIImage imageNamed:@"questionMark"];
                                    [[self.contentView viewWithTag:133] removeFromSuperview];;
                                } completion:^(BOOL finished) {
                                    
                                }];
            }];
        });
    }
}

- (void)animateIn {
    if (number == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.4 animations:^{
                button.frame = CGRectMake(0, 110, 320, 40);
                number++;
            } completion:^(BOOL finished) {
                [UIView transitionWithView:self
                                  duration:0.4
                                   options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseInOut
                                animations:^{
                                    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 40, 280, 60)];
                                    textView.tag = 133;
                                    textView.text = @"You don't charge someone for a loan, but you do charge if you're renting it to them.";
                                    questionMark.image = [UIImage imageNamed:@"good"];
                                    [self.contentView addSubview:textView];

                                    number++;
                                } completion:NULL];
            }];
        });

    } else {
        number = 0;
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.6 animations:^{
                [[self.contentView viewWithTag:133] setAlpha:0];
                button.frame = CGRectMake(0, 60, 320, 40);
            } completion:^(BOOL finished) {
                [UIView transitionWithView:self
                                  duration:0.4
                                   options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseInOut
                                animations:^{
                                    questionMark.image = [UIImage imageNamed:@"questionMark"];
                                    [[self.contentView viewWithTag:133] removeFromSuperview];;
                                } completion:^(BOOL finished) {
                                    
                                }];
            }];
        });
    }
}

@end
