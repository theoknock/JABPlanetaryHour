//
//  DaysOfMonthViewController.m
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/17/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import "DaysOfMonthViewController.h"

@interface DaysOfMonthViewController ()

@end

@implementation DaysOfMonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}


@end
