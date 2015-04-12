//
//  UIScrollView+MKHProtocolBlocks.h
//  MKHProtocolBlocks
//
//  Created by Maxim Khatskevich on 12/04/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import <UIKit/UIKit.h>

//===

typedef void (^MKHPBUISVOnDidScroll)(UIScrollView* scrollView);
typedef void (^MKHPBUISVOnDidZoom)(UIScrollView* scrollView);
typedef void (^MKHPBUISVOnWillBeginDragging)(UIScrollView* scrollView);\
typedef CGPoint (^MKHPBUISVOnWillEndDragging)(UIScrollView* scrollView,
                                              CGPoint velocity,
                                              CGPoint targetContentOffset);
typedef void (^MKHPBUISVOnDidEndDragging)(UIScrollView* scrollView, BOOL decelerate);
typedef void (^MKHPBUISVOnWillBeginDecelerating)(UIScrollView* scrollView);
typedef void (^MKHPBUISVOnDidEndDecelerating)(UIScrollView* scrollView);
typedef void (^MKHPBUISVOnDidEndScrollingAnimation)(UIScrollView* scrollView);
typedef UIView* (^MKHPBUISVOnViewForZoomingInScrollView)(UIScrollView* scrollView);
typedef void (^MKHPBUISVOnWillBeginZooming)(UIScrollView* scrollView, UIView* view);
typedef void (^MKHPBUISVOnDidEndZooming)(UIScrollView* scrollView, UIView* view, CGFloat scale);
typedef BOOL (^MKHPBUISVOnShouldScrollToTop)(UIScrollView* scrollView);
typedef void (^MKHPBUISVOnDidScrollToTop)(UIScrollView* scrollView);

//===

@interface UIScrollView (MKHProtocolBlocks)

@property (weak, nonatomic) id<UIScrollViewDelegate> originalDelegate;

@property (copy, nonatomic) MKHPBUISVOnDidScroll onDidScroll;
@property (copy, nonatomic) MKHPBUISVOnDidZoom onDidZoom;
@property (copy, nonatomic) MKHPBUISVOnWillBeginDragging onWillBeginDragging;
@property (copy, nonatomic) MKHPBUISVOnWillEndDragging onWillEndDragging;
@property (copy, nonatomic) MKHPBUISVOnDidEndDragging onDidEndDragging;
@property (copy, nonatomic) MKHPBUISVOnWillBeginDecelerating onWillBeginDecelerating;
@property (copy, nonatomic) MKHPBUISVOnDidEndDecelerating onDidEndDecelerating;
@property (copy, nonatomic) MKHPBUISVOnDidEndScrollingAnimation onDidEndScrollingAnimation;
@property (copy, nonatomic) MKHPBUISVOnViewForZoomingInScrollView onViewForZoomingInScrollView;
@property (copy, nonatomic) MKHPBUISVOnWillBeginZooming onWillBeginZooming;
@property (copy, nonatomic) MKHPBUISVOnDidEndZooming onDidEndZooming;
@property (copy, nonatomic) MKHPBUISVOnShouldScrollToTop onShouldScrollToTop;
@property (copy, nonatomic) MKHPBUISVOnDidScrollToTop onDidScrollToTop;

// for Xcode autocomplete support:
- (void)setOnDidScroll:(MKHPBUISVOnDidScroll)onDidScroll;
- (void)setOnDidZoom:(MKHPBUISVOnDidZoom)onDidZoom;
- (void)setOnWillBeginDragging:(MKHPBUISVOnWillBeginDragging)onWillBeginDragging;
- (void)setOnWillEndDragging:(MKHPBUISVOnWillEndDragging)onWillEndDragging;
- (void)setOnDidEndDragging:(MKHPBUISVOnDidEndDragging)onDidEndDragging;
- (void)setOnWillBeginDecelerating:(MKHPBUISVOnWillBeginDecelerating)onWillBeginDecelerating;
- (void)setOnDidEndDecelerating:(MKHPBUISVOnDidEndDecelerating)onDidEndDecelerating;
- (void)setOnDidEndScrollingAnimation:(MKHPBUISVOnDidEndScrollingAnimation)onDidEndScrollingAnimation;
- (void)setOnViewForZoomingInScrollView:(MKHPBUISVOnViewForZoomingInScrollView)onViewForZoomingInScrollView;
- (void)setOnWillBeginZooming:(MKHPBUISVOnWillBeginZooming)onWillBeginZooming;
- (void)setOnDidEndZooming:(MKHPBUISVOnDidEndZooming)onDidEndZooming;
- (void)setOnShouldScrollToTop:(MKHPBUISVOnShouldScrollToTop)onShouldScrollToTop;
- (void)setOnDidScrollToTop:(MKHPBUISVOnDidScrollToTop)onDidScrollToTop;

@end
