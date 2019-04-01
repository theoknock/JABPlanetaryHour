//
//  DaysHoursCollectionViewController.m
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/26/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import "DaysHoursCollectionViewController.h"
#import "DaysHoursCollectionViewCell.h"
#import <JABPlanetaryHourFramework/JABPlanetaryHourFramework.h>

@interface DaysHoursCollectionViewController ()

@end

@implementation DaysHoursCollectionViewController

static NSString * const reuseIdentifier = @"DaysHoursCell";

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.collectionView registerClass:[DaysHoursCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 365;
}

typedef NSMutableString * (^IntegerToString)(NSInteger);
static NSString * (^concatenateTwoStrings)(IntegerToString, IntegerToString) = ^NSString * (IntegerToString string1, IntegerToString string2)
{
    return [NSString new];
};

- (void)do: (void (^)(id obj))block
{
    NSTimeInterval (^lengthOfHour)(NSDictionary<NSNumber *, NSDate *> * _Nonnull) = ^NSTimeInterval (NSDictionary<NSNumber *, NSDate *> * _Nonnull twilights) {
        return ([[twilights objectForKey:@(1)] timeIntervalSinceDate:[twilights objectForKey:@(0)]] / 12);
    };

    NSDictionary<NSNumber *, NSDate *> * _Nonnull (^twilights)(NSInteger, CLLocationCoordinate2D) = ^NSDictionary<NSNumber *, NSDate *> * _Nonnull (NSInteger julianDayNumber, CLLocationCoordinate2D coordinate) {
        return [NSDictionary new];
    };
    
    lengthOfHour(twilights(1, CLLocationCoordinate2DMake(0, 0)));
    
//    NSString *concatenatedString = stringConcat(integerToString(1), integerToString(2));
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DaysHoursCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell setPlanetSymbol:[NSString stringWithFormat:@"%lu", indexPath.item]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
