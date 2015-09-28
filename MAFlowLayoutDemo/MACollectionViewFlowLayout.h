//
//  MACollectionViewLayout.h
//  Moker
//
//  Created by YURI_JOU on 15/9/25.
//  Copyright © 2015年 SongJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MACollectionViewDelegateFlowLayout <UICollectionViewDelegate>

@required
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MACollectionViewFlowLayout : UICollectionViewLayout

@end
