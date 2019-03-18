//
//  CalendarRootViewController.h
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/17/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalendarRootViewController : UIViewController <UIPageViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *monthsOfYearContainerView;
@property (weak, nonatomic) IBOutlet UIView *daysOfMonthContainerView;

@end

NS_ASSUME_NONNULL_END
