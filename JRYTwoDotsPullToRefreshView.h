//
//  JRYTwoDotsPullToRefreshView.h
//  TwoDotsIndicatorSample
//
//  Created by Justin Schottlaender on 11/27/13.
//  Copyright (c) 2013 Justin Schottlaender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SSPullToRefresh.h>

@interface JRYTwoDotsPullToRefreshView : UIView <SSPullToRefreshContentView>

- (id)initWithFrame:(CGRect)frame indicatorTint:(UIColor *)indicatorTint readyIndicatorTint:(UIColor *)readyIndicatorTint;

@end
