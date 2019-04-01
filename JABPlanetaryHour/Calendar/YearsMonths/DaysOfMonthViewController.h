//
//  DaysOfMonthViewController.h
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/17/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DaysOfMonthViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@property (strong, nonatomic) IBOutletCollection(NSObject) NSArray *dayOrdinalsLabelsOutletCollection;
@property (strong, nonatomic) IBOutletCollection(UIStackView) NSArray *weekStackViews;
@property (weak, nonatomic) IBOutlet UIStackView *week1StackView;
@property (weak, nonatomic) IBOutlet UIStackView *week2StackView;
@property (weak, nonatomic) IBOutlet UIStackView *week3StackView;
@property (weak, nonatomic) IBOutlet UIStackView *week4StackView;

@end

NS_ASSUME_NONNULL_END
