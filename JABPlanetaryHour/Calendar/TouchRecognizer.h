//
//  TouchRecognizer.h
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/18/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//
//  [self.view addGestureRecognizer:[[DayOrdinalTouchRecognizer alloc] initWithTarget:self action:@selector(handleViewTouch:)]];
//
/*- (void)handleViewTouch:(DayOrdinalTouchRecognizer *)touch
{
    //    [self.view.layer setBorderWidth:1.0];
    //    [self.view.layer setBorderColor:[UIColor redColor].CGColor];
}
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TouchRecognizer : UIGestureRecognizer

@end

NS_ASSUME_NONNULL_END
