//
//  ViewController.m
//  MAFlowLayoutDemo
//
//  Created by YURI_JOU on 15/9/28.
//  Copyright © 2015年 oenius. All rights reserved.
//

#import "ViewController.h"
#import "MACollectionViewFlowLayout.h"

@interface ViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
MACollectionViewDelegateFlowLayout
>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [UIApplication sharedApplication].statusBarHidden = YES;
  self.collectionView.backgroundColor = [UIColor whiteColor];
  
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  [self.collectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kCell" forIndexPath:indexPath];
  
  CGFloat hue = ( arc4random() % 256 / 256.0 );
  CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
  CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
  
  cell.backgroundColor =  [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
  return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return 88;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return CGSizeMake(
                    floor(CGRectGetWidth([UIScreen mainScreen].bounds) / 2),
                    floor(CGRectGetWidth([UIScreen mainScreen].bounds) / 2) + arc4random() % 225
                    );
}


@end
