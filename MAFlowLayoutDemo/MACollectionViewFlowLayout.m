//
//  MACollectionViewLayout.m
//  Moker
//
//  Created by YURI_JOU on 15/9/25.
//  Copyright © 2015年 SongJiang. All rights reserved.
//

#import "MACollectionViewFlowLayout.h"

typedef NS_ENUM(NSInteger, MALayoutDirection)
{
  MALayoutDirectionRight,
  MALayoutDirectionLeft,
  MALayoutDirectionBoth,
};

@interface MACollectionViewFlowLayout()

@property (nonatomic, strong) id<MACollectionViewDelegateFlowLayout> delegate;

@property (nonatomic, assign) CGPoint connectedLeft;
@property (nonatomic, assign) CGPoint connectedRight;

@property (nonatomic, strong) NSMutableArray *itemsAttributes;

@end

@implementation MACollectionViewFlowLayout

#pragma mark - private
- (MALayoutDirection)selectConnectedPointDirection
{
  MALayoutDirection direction = self.connectedLeft.y <= self.connectedRight.y ?
  MALayoutDirectionLeft :
  MALayoutDirectionRight;
  return direction;
}

- (void)setupConnectedPoint
{
  self.connectedLeft = CGPointZero;
  self.connectedRight = CGPointMake(floor(CGRectGetWidth(self.collectionView.frame) / 2), 0.f);
}

- (void)updateConnnectedPoint:(CGSize)size direction:(MALayoutDirection)direction
{
  CGPoint point = CGPointZero;
  if (size.width > floor(CGRectGetWidth(self.collectionView.frame) / 2))
  {
    direction = MALayoutDirectionBoth;
  }
  
  if (direction == MALayoutDirectionLeft || direction == MALayoutDirectionBoth)
  {
    point = self.connectedLeft;
    point.y += size.height;
    self.connectedLeft = point;
  }
  
  if(direction == MALayoutDirectionRight || direction == MALayoutDirectionBoth)
  {
    point = self.connectedRight;
    point.y += size.height;
    self.connectedRight = point;
  }
}

#pragma mark - inherit
- (void)prepareLayout
{
  self.delegate = (id<MACollectionViewDelegateFlowLayout>)self.collectionView.delegate;
  [self setupConnectedPoint];
  
  NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
  
  self.itemsAttributes = [[NSMutableArray alloc]initWithCapacity:cellCount];
  
  for (int i=0 ; i < cellCount; i++)
  {
    NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
    [self.itemsAttributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
  }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
  CGPoint connectedPoint = [self selectConnectedPointDirection] == MALayoutDirectionLeft? self.connectedLeft : self.connectedRight;
  
  CGSize size = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
  
  CGRect frame = CGRectZero;
  frame.size = size;
  frame.origin = connectedPoint;
  
  UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
  attributes.frame = frame;
  [self updateConnnectedPoint:size direction:[self selectConnectedPointDirection]];
  [self.itemsAttributes addObject:attributes];
  return attributes;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
  
  NSPredicate *filterPredicate = [NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes * evaluatedObject, NSDictionary *bindings) {
    BOOL predicateRetVal = CGRectIntersectsRect(rect, [evaluatedObject frame]);
    return predicateRetVal;
  }];
  
  NSArray *retVal = [self.itemsAttributes filteredArrayUsingPredicate:filterPredicate];
  return retVal;
}

-(CGSize)collectionViewContentSize
{
  CGFloat height =
  [self selectConnectedPointDirection] == MALayoutDirectionLeft?
  self.connectedRight.y : self.connectedLeft.y;
  
  return CGSizeMake(CGRectGetWidth(self.collectionView.frame), height);
}

@end
