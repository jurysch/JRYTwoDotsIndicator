//
//  JRYTwoDotsPullToRefreshView.m
//  TwoDotsIndicatorSample
//
//  Created by Justin Schottlaender on 11/27/13.
//  Copyright (c) 2013 Justin Schottlaender. All rights reserved.
//

#import "JRYTwoDotsPullToRefreshView.h"
#import "JRYTwoDotsView.h"
#import "JRYTwoDotsActivityIndicatorView.h"

@interface JRYTwoDotsPullToRefreshView ()

@property CGFloat progress;
@property JRYTwoDotsView *twoDotsView;
@property JRYTwoDotsActivityIndicatorView *activityIndicator;

@end

@implementation JRYTwoDotsPullToRefreshView

- (id)initWithFrame:(CGRect)frame indicatorTint:(UIColor *)indicatorTint readyIndicatorTint:(UIColor *)readyIndicatorTint
{
    self = [super initWithFrame:frame];
    if (self) {
        _twoDotsView = [[JRYTwoDotsView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)
                                                   tintColor:indicatorTint
                                              secondaryColor:readyIndicatorTint];
        
        _activityIndicator = [[JRYTwoDotsActivityIndicatorView alloc] initWithFrame:_twoDotsView.frame tintColor:readyIndicatorTint];
        _activityIndicator.hidesWhenStopped = YES;
        
        [self addSubview:_twoDotsView];
        [self addSubview:_activityIndicator];
        
        self.backgroundColor = [UIColor colorWithRed:0.95f green:0.93f blue:0.95f alpha:1.00f];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _twoDotsView.center = CGPointMake(floorf(self.bounds.size.width / 2.0f), floorf(self.bounds.size.height / 2.0f));
    _activityIndicator.center = _twoDotsView.center;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.twoDotsView.transform = CGAffineTransformMakeRotation(-2 * M_PI * self.progress);
}

- (void)setState:(SSPullToRefreshViewState)state withPullToRefreshView:(SSPullToRefreshView *)view
{
    switch (state) {
        case SSPullToRefreshViewStateNormal:
            _twoDotsView.hidden = NO;
            break;
            
        case SSPullToRefreshViewStateLoading:
            _twoDotsView.hidden = YES;
            [_activityIndicator startAnimating];
            break;
            
        case SSPullToRefreshViewStateReady:
            _twoDotsView.hidden = NO;
            break;
            
        case SSPullToRefreshViewStateClosing:
            [_activityIndicator stopAnimating];
            break;
            
        default:
            break;
    }
}

- (void)setPullProgress:(CGFloat)pullProgress
{
    self.twoDotsView.useSecondaryColor = (pullProgress >= 1.0);
    
    _progress = pullProgress;
    
    if (_progress > 1.0)
        _progress = 1.0;
    
    [self setNeedsDisplay];
}

@end
