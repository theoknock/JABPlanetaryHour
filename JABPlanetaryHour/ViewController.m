//
//  ViewController.m
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/15/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//
//  Root view controller for calendar and map view controllers; defaults to last presented view controller on launch

#import "ViewController.h"
#import <JABPlanetaryHourFramework/JABPlanetaryHourFramework.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Location.locator deviceLocation:^(CLLocation * _Nonnull location) {
        NSLog(@"COORDINATE\t%f, %f", location.coordinate.latitude, location.coordinate.longitude);
        [SolarTransits.calculator.solarTransits([NSDate date], location) enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSDate *  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"%@ : %@", key, obj);
        }];
    }];
}


@end
