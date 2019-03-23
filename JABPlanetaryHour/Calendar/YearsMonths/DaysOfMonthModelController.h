//
//  DaysOfMonthModelController.h
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/17/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DaysOfMonthViewController;

@interface DaysOfMonthModelController : NSObject <UIPageViewControllerDataSource>

- (DaysOfMonthViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DaysOfMonthViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
