//
//  UICollectionView+MKHProtocolBlocks.h
//  MKHProtocolBlocks
//
//  Created by Maxim Khatskevich on 12/04/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+MKHProtocolBlocks.h"

//===

typedef void (^MKHPBUICVOnDidSelectItem)(UICollectionView* collectionView, NSIndexPath *indexPath);
typedef void (^MKHPBUICVOnDidDeselectItem)(UICollectionView* collectionView, NSIndexPath *indexPath);

//===

@interface UICollectionView (MKHProtocolBlocks)

@property (weak, nonatomic) id<UICollectionViewDelegate> originalDelegate;

@property (copy, nonatomic) MKHPBUICVOnDidSelectItem onDidSelectItem;
@property (copy, nonatomic) MKHPBUICVOnDidDeselectItem onDidDeselectItem;

// for Xcode autocomplete support:
- (void)setOnDidSelectItem:(MKHPBUICVOnDidSelectItem)onDidSelectItem;
- (void)setOnDidDeselectItem:(MKHPBUICVOnDidDeselectItem)onDidDeselectItem;

@end
