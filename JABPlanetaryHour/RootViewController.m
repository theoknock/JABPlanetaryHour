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

@interface RootViewController ()

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
    
    [Location.locator deviceLocation:^(CLLocation * _Nonnull location) {
        NSLog(@"COORDINATE\t%f, %f", location.coordinate.latitude, location.coordinate.longitude);
        [SolarTransits.calculator.solarTransits([NSDate date], location) enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSDate *  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"%@ : %@", key, obj);
        }];
    }];
}


@end
