//
//  ViewController.m
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/15/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//
//  Root view controller for calendar and map view controllers; defaults to last presented view controller on launch

#import "RootViewController.h"
#import "CalendarRootViewController.h"
#import <JABPlanetaryHourFramework/JABPlanetaryHourFramework.h>
#import <CoreMedia/CoreMedia.h>

@interface RootViewController ()
{
    // First array indices == day of year
    // Second array of indicies == hour of day
    // Block returns planetary hour for day
    NSMutableArray<NSMutableArray<dispatch_block_t> *> *arrays;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CalendarRootViewController *calendarRootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CalendarRootViewController"];
    
    [self addChildViewController:calendarRootViewController];
    [self.view addSubview:calendarRootViewController.view];
    
    // Set the calendar root view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    CGRect calendarViewRect = self.view.bounds;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        calendarViewRect = CGRectInset(calendarViewRect, 40.0, 40.0);
    }
    calendarRootViewController.view.frame = calendarViewRect;
    
    [calendarRootViewController didMoveToParentViewController:self];
    
//    CMTime (^currentTime)(void) = ^(void) {
//        return CMClockGetTime(CMClockGetHostTimeClock());
//    };
    
    typedef void(^ExecutionTimeMeasurement)(CMTime timeElapsed);
    typedef void(^MeasureExecutionTime)(ExecutionTimeMeasurement executionTime);
    void(^measureExecutionTime)(CMTime, ExecutionTimeMeasurement) = ^(CMTime startTime, ExecutionTimeMeasurement executionTime)
    {
        __block int count = 0;
        NSIndexSet *days  = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, 10000)];
        NSIndexSet *data  = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, 8)];
        NSIndexSet *hours = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, 23)];
        [SolarCycles.data solarCyclesForDays:days planetaryHourData:data planetaryHours:hours completionBlock:^(NSDictionary<NSNumber *,NSDate *> * _Nonnull) {
            count++;
            [solarCycle enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSDate * _Nonnull obj, BOOL * _Nonnull stop) {
                NSLog(@"%@ : %@", key, obj);
            }];
            NSLog(@"-----");
            if (count >= 9999) executionTime(CMTimeSubtract(CMClockGetTime(CMClockGetHostTimeClock()), startTime));
        } planetaryHourCompletionBlock:^(NSDictionary<NSNumber *,NSDate *> * _Nonnull) {
            NSLog(@"Planetary hour data completion block called");
        }];

        executionTime(CMTimeSubtract(CMClockGetTime(CMClockGetHostTimeClock()), startTime));
    };
    
    measureExecutionTime(CMClockGetTime(CMClockGetHostTimeClock()), ^(CMTime elapsedTime) {
        CMTimeShow(elapsedTime);
    });
}


@end
