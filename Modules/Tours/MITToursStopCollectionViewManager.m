#import "MITToursStopCollectionViewManager.h"
#import "MITToursStopCollectionViewCell.h"
#import "UIKit+MITAdditions.h"

@implementation MITToursStopCollectionViewManager

static NSString * const kCellReuseIdentifier = @"MITToursStopCollectionViewCell";

- (void)setup
{
    UINib *cellNib = [UINib nibWithNibName:@"MITToursStopCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:kCellReuseIdentifier];
    
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast * 0.5;
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.stopsInDisplayOrder) {
        return self.stopsInDisplayOrder.count;
    }
    return self.stops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MITToursStopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    MITToursStop *stop = [self stopForIndexPath:indexPath];
    NSURL *imageURL = [NSURL URLWithString:[stop thumbnailURL]];
    
    // Get canonical number of stop
    NSString *title = stop.title;
    NSInteger index = [self.stops indexOfObject:stop];
    if (index != NSNotFound) {
        title = [NSString stringWithFormat:@"%d. %@", index + 1, stop.title];
    }
    [cell configureForImageURL:imageURL title:title];
    
    if (stop == self.selectedStop) {
        cell.backgroundColor = [UIColor mit_backgroundColor];
    } else {
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}

#pragma mark - Data Source Helpers

- (MITToursStop *)stopForIndexPath:(NSIndexPath *)path
{
    NSArray *stops = self.stopsInDisplayOrder;
    if (!stops) {
        stops = self.stops;
    }
    return [stops objectAtIndex:path.item];
}

#pragma mark - UICollectionViewDelegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(collectionView:didSelectItemForStop:)]) {
        MITToursStop *stop = [self stopForIndexPath:indexPath];
        [self.delegate collectionView:self.collectionView didSelectItemForStop:stop];
    }
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
}

@end
