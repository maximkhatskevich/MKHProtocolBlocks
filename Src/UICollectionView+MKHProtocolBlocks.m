//
//  UICollectionView+MKHProtocolBlocks.m
//  MKHProtocolBlocks
//
//  Created by Maxim Khatskevich on 12/04/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "UICollectionView+MKHProtocolBlocks.h"
#import <objc/runtime.h>

//===

#define delegateProtocolName UICollectionViewDelegate
#define delegateType id<delegateProtocolName>

//===

static const void *MKHPBUICVOnDidSelectItemKey = &MKHPBUICVOnDidSelectItemKey;
static const void *MKHPBUICVOnDidDeselectItemKey = &MKHPBUICVOnDidDeselectItemKey;

//===

@implementation UICollectionView (MKHProtocolBlocks)

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

- (id<UICollectionViewDelegate>)originalDelegate
{
    return (id<UICollectionViewDelegate>)[super originalDelegate];
}

- (void)setOriginalDelegate:(id<UICollectionViewDelegate>)originalDelegate
{
    [super setOriginalDelegate:originalDelegate];
}

//===

- (MKHPBUICVOnDidSelectItem)onDidSelectItem
{
    return objc_getAssociatedObject(self, MKHPBUICVOnDidSelectItemKey);
}

- (void)setOnDidSelectItem:(MKHPBUICVOnDidSelectItem)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUICVOnDidSelectItemKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//===

- (MKHPBUICVOnDidDeselectItem)onDidDeselectItem
{
    return objc_getAssociatedObject(self, MKHPBUICVOnDidDeselectItemKey);
}

- (void)setOnDidDeselectItem:(MKHPBUICVOnDidDeselectItem)handler
{
    [self checkDelegate];
    objc_setAssociatedObject(self,
                             MKHPBUICVOnDidDeselectItemKey,
                             handler,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MKHPBUICVOnDidSelectItem handler = collectionView.onDidSelectItem;
    
    if (handler)
    {
        handler(collectionView, indexPath);
    }
    
    //===
    
    id originalDelegate = collectionView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:
         @selector(collectionView:didSelectItemAtIndexPath:)])
    {
        [originalDelegate collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MKHPBUICVOnDidDeselectItem handler = collectionView.onDidDeselectItem;
    
    if (handler)
    {
        handler(collectionView, indexPath);
    }
    
    //===
    
    id originalDelegate = collectionView.originalDelegate;
    
    if (originalDelegate &&
        [originalDelegate respondsToSelector:
         @selector(collectionView:didDeselectItemAtIndexPath:)])
    {
        [originalDelegate collectionView:collectionView didDeselectItemAtIndexPath:indexPath];
    }
}

@end
