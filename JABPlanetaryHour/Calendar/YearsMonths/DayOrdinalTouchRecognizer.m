//
//  DayOrdinalTouchRecognizer.m
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/18/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import "DayOrdinalTouchRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation DayOrdinalTouchRecognizer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"touchesBegan");
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        if ([touch.view isKindOfClass:[UIStackView class]]) NSLog(@"UIStackView %@", touch.view.description);
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint viewTouchLocation = [touch preciseLocationInView:touch.view];
        
        for (UILabel *view in touch.view.subviews)
        {
//            NSLog(@"UILabel %lu", view.tag);
            if ([view isKindOfClass:[UILabel class]])
            {
                CGPoint viewToLabelPoint = [view convertPoint:viewTouchLocation fromView:touch.view];
                if (CGRectContainsPoint(view.frame, viewToLabelPoint)) {
//                    NSLog(@"UILabel touched %lu", view.tag);
                }
            }
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //    NSLog(@"touchesEnded");
    
    
    //    self.state = UIGestureRecognizerStateFailed;
}

/*
 for (UITouch *touch in touches)
 {
 
 }
 */

//NSLog(@"Location in view\t%f, %f",
//      [((UIGestureRecognizer *)touch) locationInView:self.view].x,
//      [((UIGestureRecognizer *)touch) locationInView:self.view].y);

/*
 
 UIGestureRecognizerStatePossible
 The gesture recognizer has not yet recognized its gesture, but may be evaluating touch events. This is the default state.
 UIGestureRecognizerStateBegan
 The gesture recognizer has received touch objects recognized as a continuous gesture. It sends its action message (or messages) at the next cycle of the run loop.
 UIGestureRecognizerStateChanged
 The gesture recognizer has received touches recognized as a change to a continuous gesture. It sends its action message (or messages) at the next cycle of the run loop.
 UIGestureRecognizerStateEnded
 The gesture recognizer has received touches recognized as the end of a continuous gesture. It sends its action message (or messages) at the next cycle of the run loop and resets its state to UIGestureRecognizerStatePossible.
 UIGestureRecognizerStateCancelled
 The gesture recognizer has received touches resulting in the cancellation of a continuous gesture. It sends its action message (or messages) at the next cycle of the run loop and resets its state to UIGestureRecognizerStatePossible.
 UIGestureRecognizerStateFailed
 The gesture recognizer has received a multi-touch sequence that it cannot recognize as its gesture. No action message is sent and the gesture recognizer is reset to UIGestureRecognizerStatePossible.
 UIGestureRecognizerStateRecognized
 The gesture recognizer has received a multi-touch sequence that it recognizes as its gesture. It sends its action message (or messages) at the next cycle of the run loop and resets its state to UIGestureRecognizerStatePossible.
 
 */

@end

