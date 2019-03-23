//
//  CalendarPageViewControllersModelController.h
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/17/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef int (^Year)(int);

@class MonthsOfYearViewController;

@interface MonthsOfYearModelController : NSObject <UIPageViewControllerDataSource>

- (MonthsOfYearViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(MonthsOfYearViewController *)viewController;

//@property (strong, nonatomic) Year startYear;
//@property (strong, nonatomic) Year endYear;

@end

NS_ASSUME_NONNULL_END
