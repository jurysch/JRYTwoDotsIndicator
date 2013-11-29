//
//  JRYTwoDotsView.m
//  TwoDotsIndicatorSample
//
//  Created by Justin Schottlaender on 11/27/13.
//  Copyright (c) 2013 Justin Schottlaender. All rights reserved.
//

#import "JRYTwoDotsView.h"

@interface JRYTwoDotsView ()

@property (nonatomic) UIColor *tintColor;
@property (nonatomic) UIColor *secondaryColor;

@end

@implementation JRYTwoDotsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tintColor = [UIColor lightGrayColor];
        _secondaryColor = [UIColor darkGrayColor];
        _useSecondaryColor = NO;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame tintColor:(UIColor *)tintColor secondaryColor:(UIColor *)secondaryColor
{
    self = [super initWithFrame:frame];
    if (self) {
        if (tintColor && secondaryColor) {
            _tintColor = tintColor;
            _secondaryColor = secondaryColor;
        }
        else {
            _tintColor = [UIColor lightGrayColor];
            _secondaryColor = [UIColor darkGrayColor];
        }
        
        _useSecondaryColor = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (self.useSecondaryColor) {
        [self.secondaryColor setStroke];
        [self.secondaryColor setFill];
    }
    else {
        [self.tintColor setStroke];
        [self.tintColor setFill];
    }
    
    CGRect insetFrameRect = CGRectInset(rect, 2, 2);
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect:insetFrameRect];
    ovalPath.lineWidth = 3;
    [ovalPath stroke];
    
    CGSize dotSize = CGSizeMake(6, 6);
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(insetFrameRect.origin.x + insetFrameRect.size.width/2 - dotSize.width/2,
                                                                                 insetFrameRect.origin.y + ovalPath.lineWidth + 2,
                                                                                 dotSize.width,
                                                                                 dotSize.height)];
    [oval2Path fill];
    oval2Path.lineWidth = 1;
    [oval2Path stroke];
    
    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(insetFrameRect.origin.x + insetFrameRect.size.width/2 - dotSize.width/2,
                                                                                 insetFrameRect.size.height - (ovalPath.lineWidth + 5),
                                                                                 dotSize.width,
                                                                                 dotSize.height)];
    [oval3Path fill];
    oval3Path.lineWidth = 1;
    [oval3Path stroke];
}

- (void)setUseSecondaryColor:(BOOL)useSecondaryColor
{
    if (_useSecondaryColor == useSecondaryColor)
        return;
    
    _useSecondaryColor = useSecondaryColor;
    [self setNeedsDisplay];
}

@end
