# MAFlowLayout

MACollectionViewFlowLayout is a subclass of UICollectionViewLayout that could position cell via various cell's height.

Example
-------

![Framed example screenshot](https://github.com/oenius/MAFlowLayout/blob/master/MAFlowLayoutDemo/demo.png)

Usage
-----

```objective-c

@interface ViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
MACollectionViewDelegateFlowLayout
>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//where u should return a certain size 
//u want
}

```

License
-------
	Copyright 2015 Oenius Jou
	
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	    http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
