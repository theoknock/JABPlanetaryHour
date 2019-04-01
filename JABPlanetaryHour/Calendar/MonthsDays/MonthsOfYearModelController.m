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

@end


@implementation MonthsOfYearModelController

//typedef NSUInteger (^RangeEndpoint)(dispatch_block_t);
//typedef struct {
//    RangeEndpoint start;
//    RangeEndpoint end;
//} RangeEndpoints;
//RangeEndpoints rangeEndpoints;
//
//typedef enum : NSUInteger {
//    startRangeEndpoint,
//    endRangeEndpoint
//} YearRangeEndpoint;
//
//int (^calculateEndpointStart)(void) = ^int(void) {
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
//
//    return (int)components.year - 1;
//};
//
//typedef int(^Endpoint)(void);
//Endpoint (^setEndpointStart)(void) = ^Endpoint (void) {
//    return ^int() {
//        return calculateEndpointStart();
//    };
//};
//
//Endpoint endpointStart = setEndpointStart();
//
//void (^yearRangeEndpointsRef)(NSUInteger, NSUInteger, YearRangeEndpoints) = ^(NSUInteger startRangeYear, NSUInteger endRangeYear, YearRangeEndpoints endpointsRef) {
//    NSUInteger yearRangeEndpointsVar[2] = {startRangeYear, endRangeYear};
//    NSUInteger *yearRangeEndpointsPointer = &yearRangeEndpointsVar[2];
//
//    endpointsRef(yearRangeEndpointsPointer);
//};
//
//void (^yearRangeEndpoints)(YearRangeEndpoints) = ^NSUInteger *(YearRangeEndpoints yearRangeEndpoints) {
//    NSUInteger *yearRangeEndpointsPointer = &yearRangeEndpointsArr[2];
//
//    return yearRangeEndpointsPointer;
//};
//
//void (^setYearForRangeEndpoint)(YearRangeEndpoint, NSUInteger) = ^(YearRangeEndpoint endpoint, NSUInteger year) {
//    yearRangeEndpointsVar[endpoint] = year;
//};
//
//NSUInteger (^yearForRangeEndpoint)(YearRangeEndpoint) = ^(YearRangeEndpoint endpoint) {
//    return yearRangeEndpointsVar[endpoint];
//};
//
//void (^setYearRangeEndpoints)(NSUInteger *) = ^(NSUInteger *endpoints) {
//    for (YearRangeEndpoint endpoint = endpoints[startRangeEndpoint]; endpoint == endpoints[endRangeEndpoint]; endpoint++)
//    {
//        setYearForRangeEndpoint(endpoint, (endpoint == endpoints[startRangeEndpoint]) ? ((endpoints[startRangeEndpoint] < endpoints[endRangeEndpoint]) ? endpoints[startRangeEndpoint] : yearForRangeEndpoint(endpoint)) : ((endpoints[endRangeEndpoint] > endpoints[startRangeEndpoint]) ? endpoints[endRangeEndpoint] : yearForRangeEndpoint(endpoint)));
//    }
//};

NSArray<NSNumber *> *(^pageData)(void) = ^(void) {
    NSMutableArray<NSNumber *> *years = [NSMutableArray arrayWithCapacity:2030-2018];//yearForRangeEndpoint(endRangeEndpoint) - yearForRangeEndpoint(startRangeEndpoint)];
    for (NSUInteger year = 2018 /*yearForRangeEndpoint(startRangeEndpoint)*/; year < 2030 /*yearForRangeEndpoint(endRangeEndpoint) + 1*/; year++)
    {
        [years addObject:[NSNumber numberWithUnsignedInteger:year]];
//        NSLog(@"year %lu", year);
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
//        setYearForRangeEndpoint(startRangeEndpoint, components.year - 1);
//        setYearForRangeEndpoint(endRangeEndpoint, components.year + 10);
//        NSUInteger endpoints[2] = {2018, 2029};
//        NSUInteger
//        setRangeEndpoints(yearRangeEndpoint);
//        NSLog(@"Start: %lu\tEnd: %lu", yearRangeEndpoint[startRangeEndpoint], yearRangeEndpoint[endRangeEndpoint]);
//        [pageData() enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSLog(@"Year %lu", obj.unsignedIntegerValue);
//        }];
    }
    return self;
}

- (MonthsOfYearViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
//    NSLog(@"[pageData() count] %lu", [pageData() count]);
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
