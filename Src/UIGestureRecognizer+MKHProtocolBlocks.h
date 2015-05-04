//
//  UIGestureRecognizer+MKHProtocolBlocks.h
//  MKHProtocolBlocks
//
//  Created by Maxim Khatskevich on 24/04/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import <UIKit/UIKit.h>

//===

typedef void (^MKHPBUIGROnShouldBegin)(UIGestureRecognizer *recognizer);
typedef void (^MKHPBUIGROnShouldRecognizeSimultaneouslyWithRecognizer)(UIGestureRecognizer *recognizer, UIGestureRecognizer *otherRecognizer);
typedef void (^MKHPBUIGROnShouldRequireFailureOfGestureRecognizer)(UIGestureRecognizer *recognizer, UIGestureRecognizer *otherRecognizer);
//typedef void (^MKHPBUIGROnShould)(UIGestureRecognizer *recognizer);
//typedef void (^MKHPBUIGROnShould)(UIGestureRecognizer *recognizer);

//===

@interface UIGestureRecognizer (MKHProtocolBlocks)

@end


/*
 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
 
 - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;
 
 - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0);
 
 - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0);
 
 - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
 */