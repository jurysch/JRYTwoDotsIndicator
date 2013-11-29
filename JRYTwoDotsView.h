//
//  JRYTwoDotsView.h
//  TwoDotsIndicatorSample
//
//  Created by Justin Schottlaender on 11/27/13.
//  Copyright (c) 2013 Justin Schottlaender. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRYTwoDotsView : UIView

- (id)initWithFrame:(CGRect)frame tintColor:(UIColor *)tintColor secondaryColor:(UIColor *)secondaryColor;

@property CAShapeLayer *insetShapeLayer;
@property (nonatomic) BOOL useSecondaryColor;

@end
