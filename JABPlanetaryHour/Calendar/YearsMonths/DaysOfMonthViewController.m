//
//  DaysOfMonthViewController.m
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/17/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import "DaysOfMonthViewController.h"
#import "DayOrdinalTouchRecognizer.h"


@interface DaysOfMonthViewController ()

@end

@implementation DaysOfMonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addGestureRecognizer:[[DayOrdinalTouchRecognizer alloc] initWithTarget:self action:@selector(handleViewTouch:)]];
//    [(NSArray<UIStackView *> *)self.weekStackViews enumerateObjectsUsingBlock:^(UIStackView * _Nonnull stackView, NSUInteger idx, BOOL * _Nonnull stop) {
//        [stackView setTag:idx];
//        [stackView addGestureRecognizer:[[DayOrdinalTouchRecognizer alloc] initWithTarget:self action:@selector(handleTouch:)]];
//        NSLog(@"UIStackView %lu", stackView.tag);
//        [(NSArray<UILabel *> *)self.dayOrdinalsLabelsOutletCollection enumerateObjectsUsingBlock:^(UILabel * _Nonnull label, NSUInteger idx, BOOL * _Nonnull stop) {
//            [label setTag:idx];
//        }];
//    }];
}

//- (void)handleTouch:(DayOrdinalTouchRecognizer *)touch
//{
//    [(UILabel *)touch.view setHighlighted:![(UILabel *)touch.view isHighlighted]];
//}

- (void)handleViewTouch:(DayOrdinalTouchRecognizer *)touch
{
    //    [self.view.layer setBorderWidth:1.0];
    //    [self.view.layer setBorderColor:[UIColor redColor].CGColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}


@end

