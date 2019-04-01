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
    
    [(NSArray<UIStackView *> *)self.weekStackViews enumerateObjectsUsingBlock:^(UIStackView * _Nonnull stackView, NSUInteger stack_idx, BOOL * _Nonnull stop) {
//        [stackView setTag:idx];
//        [stackView addGestureRecognizer:[[DayOrdinalTouchRecognizer alloc] initWithTarget:self action:@selector(handleTouch:)]];
//        NSLog(@"UIStackView %lu", stackView.tag);
        [(NSArray<UILabel *> *)stackView.arrangedSubviews enumerateObjectsUsingBlock:^(UILabel * _Nonnull label, NSUInteger idx, BOOL * _Nonnull stop) {
            [label setText:[NSString stringWithFormat:@"%lu", idx + (stackView.tag * 7)]];
        }];
    }];
}

//- (void)handleTouch:(DayOrdinalTouchRecognizer *)touch
//{
//    [(UILabel *)touch.view setHighlighted:![(UILabel *)touch.view isHighlighted]];
//}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}


@end

