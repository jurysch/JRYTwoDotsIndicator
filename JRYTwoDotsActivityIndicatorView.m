//
//  JRYTwoDotsActivityIndicatorView.m
//  TwoDotsIndicatorSample
//
//  Created by Justin Schottlaender on 11/27/13.
//  Copyright (c) 2013 Justin Schottlaender. All rights reserved.
//

#import "JRYTwoDotsActivityIndicatorView.h"
#import "JRYTwoDotsView.h"

@interface JRYTwoDotsActivityIndicatorView ()

@property UIColor *tintColor;
@property JRYTwoDotsView *dotsView;

@end

@implementation JRYTwoDotsActivityIndicatorView

- (id)initWithFrame:(CGRect)frame tintColor:(UIColor *)tintColor
{
    self = [super initWithFrame:frame];
    if (self) {
        _dotsView = [[JRYTwoDotsView alloc] initWithFrame:frame tintColor:tintColor secondaryColor:tintColor];
        [self addSubview:_dotsView];
        
        self.backgroundColor = [UIColor clearColor];
        self.hidesWhenStopped = YES;
    }
    return self;
}

- (id)initWithTintColor:(UIColor *)tintColor
{
    self = [super init];
    if (self) {
        if (tintColor)
            _tintColor = tintColor;
        else
            _tintColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _dotsView.center = CGPointMake(floorf(self.bounds.size.width / 2.0f),
                                   floorf(self.bounds.size.height / 2.0f));
}

+ (Class)layerClass
{
    return CAShapeLayer.class;
}

- (CAShapeLayer *)shapeLayer
{
    return (CAShapeLayer *)self.layer;
}

- (void)startAnimating
{
	if ([self isAnimating])
        return;
    
	self.hidden = NO;
    
	_animating = YES;
    
    [self addAnimation];
    
    if (self.hidesWhenStopped)
        self.hidden = NO;
}

- (void)stopAnimating
{
	if (![self isAnimating])
        return;
    
    _animating = NO;
    
    [self removeAnimation];
    
    if (self.hidesWhenStopped)
        self.hidden = YES;
}

- (void)setHidesWhenStopped:(BOOL)hides
{
	_hidesWhenStopped = hides;
	if (![self isAnimating]) {
		self.hidden = YES;
	}
}

- (void)addAnimation
{
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.toValue        = @(2 * M_PI);
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    spinAnimation.duration       = 1.5;
    spinAnimation.repeatCount    = INFINITY;
    
    [self.dotsView.layer addAnimation:spinAnimation forKey:@"TwoDotsSpinAnimationKey"];
}

- (void)removeAnimation
{
    [self.dotsView.layer removeAnimationForKey:@"TwoDotsSpinAnimationKey"];
}

@end
