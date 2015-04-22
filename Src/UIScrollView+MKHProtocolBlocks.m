//
//  UIScrollView+MKHProtocolBlocks.m
//  MKHProtocolBlocks
//
//  Created by Maxim Khatskevich on 12/04/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "UIScrollView+MKHProtocolBlocks.h"
#import <objc/runtime.h>

//===

#define delegateProtocolName UIScrollViewDelegate
#define delegateType id<delegateProtocolName>

//===

static const void *MKHPBUISVOriginalDelegateKey = &MKHPBUISVOriginalDelegateKey;

static const void *MKHPBUISVOnDidScrollKey = &MKHPBUISVOnDidScrollKey;
static const void *MKHPBUISVOnDidZoomKey = &MKHPBUISVOnDidZoomKey;
static const void *MKHPBUISVOnWillBeginDraggingKey = &MKHPBUISVOnWillBeginDraggingKey;
static const void *MKHPBUISVOnWillEndDraggingKey = &MKHPBUISVOnWillEndDraggingKey;
static const void *MKHPBUISVOnDidEndDraggingKey = &MKHPBUISVOnDidEndDraggingKey;
static const void *MKHPBUISVOnWillBeginDeceleratingKey = &MKHPBUISVOnWillBeginDeceleratingKey;
static const void *MKHPBUISVOnDidEndDeceleratingKey = &MKHPBUISVOnDidEndDeceleratingKey;
static const void *MKHPBUISVOnDidEndScrollingAnimationKey = &MKHPBUISVOnDidEndScrollingAnimationKey;
static const void *MKHPBUISVOnViewForZoomingInScrollViewKey = &MKHPBUISVOnViewForZoomingInScrollViewKey;
static const void *MKHPBUISVOnWillBeginZoomingKey = &MKHPBUISVOnWillBeginZoomingKey;
static const void *MKHPBUISVOnDidEndZoomingKey = &MKHPBUISVOnDidEndZoomingKey;
static const void *MKHPBUISVOnShouldScrollToTopKey = &MKHPBUISVOnShouldScrollToTopKey;
static const void *MKHPBUISVOnDidScrollToTopKey = &MKHPBUISVOnDidScrollToTopKey;

//===

@implementation UIScrollView (MKHProtocolBlocks)

#pragma mark - Internal helper

- (void)checkDelegate
{
    if (self.delegate != (delegateType)self)
    {
        self.originalDelegate = self.delegate;
        self.delegate = (delegateType)self;
    }
}

#pragma mark - Property accessors

- (id<UIScrollViewDelegate>)originalDelegate
{
    return objc_getAssociatedObject(self, MKHPBUISVOriginalDelegateKey);
}

- (void)setOriginalDelegate:(id<UIScrollViewDelegate>)value
{
    objc_setAssociatedObject(self,
                             MKHPBUISVOriginalDelegateKey,
                             value,
                             OBJC_ASSOCIATION_ASSIGN);
}

- (MKHPBUISVOnDidScroll)onDidScroll
{
    return objc_getAssociatedObject(self, MKHPBUISVOnDidScrollKey);
}

- (void)setOnDidScroll:(MKHPBUISVOnDidScroll)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnDidScrollKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnDidZoom)onDidZoom
{
    return objc_getAssociatedObject(self, MKHPBUISVOnDidZoomKey);
}

- (void)setOnDidZoom:(MKHPBUISVOnDidZoom)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnDidZoomKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnWillBeginDragging)onWillBeginDragging
{
    return objc_getAssociatedObject(self, MKHPBUISVOnWillBeginDraggingKey);
}

- (void)setOnWillBeginDragging:(MKHPBUISVOnWillBeginDragging)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnWillBeginDraggingKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnWillEndDragging)onWillEndDragging
{
    return objc_getAssociatedObject(self, MKHPBUISVOnWillEndDraggingKey);
}

- (void)setOnWillEndDragging:(MKHPBUISVOnWillEndDragging)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnWillEndDraggingKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnDidEndDragging)onDidEndDragging
{
    return objc_getAssociatedObject(self, MKHPBUISVOnDidEndDraggingKey);
}

- (void)setOnDidEndDragging:(MKHPBUISVOnDidEndDragging)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnDidEndDraggingKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnWillBeginDecelerating)onWillBeginDecelerating
{
    return objc_getAssociatedObject(self, MKHPBUISVOnWillBeginDeceleratingKey);
}

- (void)setOnWillBeginDecelerating:(MKHPBUISVOnWillBeginDecelerating)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnWillBeginDeceleratingKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnDidEndDecelerating)onDidEndDecelerating
{
    return objc_getAssociatedObject(self, MKHPBUISVOnDidEndDeceleratingKey);
}

- (void)setOnDidEndDecelerating:(MKHPBUISVOnDidEndDecelerating)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnDidEndDeceleratingKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnDidEndScrollingAnimation)onDidEndScrollingAnimation
{
    return objc_getAssociatedObject(self, MKHPBUISVOnDidEndScrollingAnimationKey);
}

- (void)setOnDidEndScrollingAnimation:(MKHPBUISVOnDidEndScrollingAnimation)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnDidEndScrollingAnimationKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnViewForZoomingInScrollView)onViewForZoomingInScrollView
{
    return objc_getAssociatedObject(self, MKHPBUISVOnViewForZoomingInScrollViewKey);
}

- (void)setOnViewForZoomingInScrollView:(MKHPBUISVOnViewForZoomingInScrollView)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnViewForZoomingInScrollViewKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnWillBeginZooming)onWillBeginZooming
{
    return objc_getAssociatedObject(self, MKHPBUISVOnWillBeginZoomingKey);
}

- (void)setOnWillBeginZooming:(MKHPBUISVOnWillBeginZooming)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnWillBeginZoomingKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnDidEndZooming)onDidEndZooming
{
    return objc_getAssociatedObject(self, MKHPBUISVOnDidEndZoomingKey);
}

- (void)setOnDidEndZooming:(MKHPBUISVOnDidEndZooming)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnDidEndZoomingKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnShouldScrollToTop)onShouldScrollToTop
{
    return objc_getAssociatedObject(self, MKHPBUISVOnShouldScrollToTopKey);
}

- (void)setOnShouldScrollToTop:(MKHPBUISVOnShouldScrollToTop)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnShouldScrollToTopKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUISVOnDidScrollToTop)onDidScrollToTop
{
    return objc_getAssociatedObject(self, MKHPBUISVOnDidScrollToTopKey);
}

- (void)setOnDidScrollToTop:(MKHPBUISVOnDidScrollToTop)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUISVOnDidScrollToTopKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    MKHPBUISVOnDidScroll handler = scrollView.onDidScroll;
    
    if (handler)
    {
        handler(scrollView);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:@selector(scrollViewDidScroll:)])
    {
        [originalDelegate scrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    MKHPBUISVOnDidZoom handler = scrollView.onDidZoom;
    
    if (handler)
    {
        handler(scrollView);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:@selector(scrollViewDidZoom:)])
    {
        [originalDelegate scrollViewDidZoom:scrollView];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    MKHPBUISVOnWillBeginDragging handler = scrollView.onWillBeginDragging;
    
    if (handler)
    {
        handler(scrollView);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)])
    {
        [originalDelegate scrollViewWillBeginDragging:scrollView];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    // see more about "inout" parameters usage http://stackoverflow.com/a/18856469
    
    MKHPBUISVOnWillEndDragging handler = scrollView.onWillEndDragging;
    
    if (handler)
    {
        *targetContentOffset = (handler(scrollView, velocity, *targetContentOffset));
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:
         @selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)])
    {
        [originalDelegate
         scrollViewWillEndDragging:scrollView
         withVelocity:velocity
         targetContentOffset:targetContentOffset];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    MKHPBUISVOnDidEndDragging handler = scrollView.onDidEndDragging;
    
    if (handler)
    {
        handler(scrollView, decelerate);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:
         @selector(scrollViewDidEndDragging:willDecelerate:)])
    {
        [originalDelegate
         scrollViewDidEndDragging:scrollView
         willDecelerate:decelerate];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    MKHPBUISVOnWillBeginDecelerating handler = scrollView.onWillBeginDecelerating;
    
    if (handler)
    {
        handler(scrollView);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:@selector(scrollViewWillBeginDecelerating:)])
    {
        [originalDelegate scrollViewWillBeginDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    MKHPBUISVOnDidEndDecelerating handler = scrollView.onDidEndDecelerating;
    
    if (handler)
    {
        handler(scrollView);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)])
    {
        [originalDelegate scrollViewDidEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    MKHPBUISVOnDidEndScrollingAnimation handler = scrollView.onDidEndScrollingAnimation;
    
    if (handler)
    {
        handler(scrollView);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:
         @selector(scrollViewDidEndScrollingAnimation:)])
    {
        [originalDelegate scrollViewDidEndScrollingAnimation:scrollView];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    UIView *result = nil;
    
    //===
    
    MKHPBUISVOnViewForZoomingInScrollView handler = scrollView.onViewForZoomingInScrollView;
    
    if (handler)
    {
        result = handler(scrollView);
    }
    else
    {
        id originalDelegate = scrollView.originalDelegate;
        
        if (originalDelegate &&
            [originalDelegate respondsToSelector:@selector(viewForZoomingInScrollView:)])
        {
            result = [originalDelegate viewForZoomingInScrollView:scrollView];
        }
    }
    
    //===
    
    return result;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    MKHPBUISVOnWillBeginZooming handler = scrollView.onWillBeginZooming;
    
    if (handler)
    {
        handler(scrollView, view);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:
         @selector(scrollViewWillBeginZooming:withView:)])
    {
        [originalDelegate
         scrollViewWillBeginZooming:scrollView
         withView:view];
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    MKHPBUISVOnDidEndZooming handler = scrollView.onDidEndZooming;
    
    if (handler)
    {
        handler(scrollView, view, scale);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:
         @selector(scrollViewDidEndZooming:withView:atScale:)])
    {
        [originalDelegate
         scrollViewDidEndZooming:scrollView
         withView:view
         atScale:scale];
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    BOOL result = NO;
    
    //===
    
    MKHPBUISVOnShouldScrollToTop handler = scrollView.onShouldScrollToTop;
    
    if (handler)
    {
        result = handler(scrollView);
    }
    else
    {
        id originalDelegate = scrollView.originalDelegate;
        
        if (originalDelegate &&
            [originalDelegate respondsToSelector:@selector(scrollViewShouldScrollToTop:)])
        {
            result = [originalDelegate scrollViewShouldScrollToTop:scrollView];
        }
    }
    
    //===
    
    return result;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    MKHPBUISVOnDidScrollToTop handler = scrollView.onDidScrollToTop;
    
    if (handler)
    {
        handler(scrollView);
    }
    
    //===
    
    id originalDelegate = scrollView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:@selector(scrollViewDidScrollToTop:)])
    {
        [originalDelegate scrollViewDidScrollToTop:scrollView];
    }
}

@end