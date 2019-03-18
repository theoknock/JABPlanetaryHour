//
//  CalendarPageViewControllersModelController.m
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/17/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import "MonthsOfYearModelController.h"
#import "MonthsOfYearViewController.h"

@interface MonthsOfYearModelController ()

//@property (readonly, strong, nonatomic) NSArray *pageData;

@end


@implementation MonthsOfYearModelController

// Setters and getters for properties that are dependents to other properties,
// which can be set, but not without validation and control,
// and absent modification of the properties dependent; also, to provide access
// to their values to methods that are dependent on the properties, but don't set them

typedef enum : NSUInteger {
    startRangeEndpoint,
    endRangeEndpoint
} YearRangeEndpoint;

NSUInteger yearRangeEndpoint[2];
void (^setYearForRangeEndpoint)(YearRangeEndpoint, NSUInteger) = ^(YearRangeEndpoint endpoint, NSUInteger year) {
    yearRangeEndpoint[endpoint] = year;
};

NSUInteger (^yearForRangeEndpoint)(YearRangeEndpoint) = ^(YearRangeEndpoint endpoint) {
    return yearRangeEndpoint[endpoint];
};

void (^setRangeEndpoints)(NSUInteger, NSUInteger) = ^(NSUInteger startYearForRange, NSUInteger endYearForRange) {
    for (YearRangeEndpoint endpoint = startRangeEndpoint; endpoint == endRangeEndpoint; endpoint++)
    {
        setYearForRangeEndpoint(endpoint, (endpoint == startRangeEndpoint) ? ((startYearForRange < endYearForRange) ? startYearForRange : yearForRangeEndpoint(endpoint)) : ((endYearForRange > startYearForRange) ? endYearForRange : yearForRangeEndpoint(endpoint)));
    }
};

NSArray<NSNumber *> *(^pageData)(void) = ^(void) {
    NSLog(@"psgeDa4e");
    NSLog(@"Start: %lu\tEnd: %lu", yearRangeEndpoint[startRangeEndpoint], yearRangeEndpoint[endRangeEndpoint]);
    
    NSMutableArray<NSNumber *> *years = [NSMutableArray arrayWithCapacity:yearForRangeEndpoint(endRangeEndpoint) - yearForRangeEndpoint(startRangeEndpoint)];
    for (NSUInteger year = yearForRangeEndpoint(startRangeEndpoint); year < yearForRangeEndpoint(endRangeEndpoint) + 1; year++)
    {
        [years addObject:[NSNumber numberWithUnsignedInteger:year]];
        NSLog(@"year %lu", year);
    }
    
    return (NSArray<NSNumber *> *)years;
};

NSNumber * (^pageDataAtIndex)(NSUInteger) = ^(NSUInteger index) {
    NSArray<NSNumber *> *array = [NSArray arrayWithArray:[(NSArray<NSNumber *> *)pageData() copy]];
     
     return (NSNumber *)array[index];
};

- (instancetype)init {
    self = [super init];
    if (self) {
        // Set the range of years
//        setRangeEndpoints(2018, 2029);
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
        setYearForRangeEndpoint(startRangeEndpoint, components.year - 1);
        setYearForRangeEndpoint(endRangeEndpoint, components.year + 10);
        NSLog(@"Start: %lu\tEnd: %lu", yearRangeEndpoint[startRangeEndpoint], yearRangeEndpoint[endRangeEndpoint]);
        [pageData() enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"Year %lu", obj.unsignedIntegerValue);
        }];
    }
    return self;
}

- (MonthsOfYearViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    NSLog(@"[pageData() count] %lu", [pageData() count]);
    if (([pageData() count] == 0) || (index >= [pageData() count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    MonthsOfYearViewController *monthsOfYearViewController = [storyboard instantiateViewControllerWithIdentifier:@"MonthsOfYearViewController"];
    monthsOfYearViewController.dataObject = pageDataAtIndex(index);
    return monthsOfYearViewController;
}


- (NSUInteger)indexOfViewController:(MonthsOfYearViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [pageData() indexOfObject:viewController.dataObject];
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(MonthsOfYearViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(MonthsOfYearViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [pageData() count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
