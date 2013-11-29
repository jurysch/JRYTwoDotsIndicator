//
//  JRYTwoDotsActivityIndicatorView.h
//  TwoDotsIndicatorSample
//
//  Created by Justin Schottlaender on 11/27/13.
//  Copyright (c) 2013 Justin Schottlaender. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRYTwoDotsActivityIndicatorView : UIView

@property (nonatomic, assign) BOOL hidesWhenStopped;
@property (nonatomic, assign, getter = isAnimating) BOOL animating;

- (id)initWithFrame:(CGRect)frame tintColor:(UIColor *)tintColor;
- (void)startAnimating;
- (void)stopAnimating;

@end
