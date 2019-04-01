//
//  DaysHoursCollectionViewCell.m
//  JABPlanetaryHour
//
//  Created by Xcode Developer on 3/26/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

#import "DaysHoursCollectionViewCell.h"

@implementation DaysHoursCollectionViewCell
{
    UILabel *planetaryHourSymbolLabel;
    CATextLayer *planetaryHourSymbolTextLayer;
}

@synthesize planetSymbol = _planetSymbol;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor lightGrayColor]];
        
        planetaryHourSymbolTextLayer = [CATextLayer layer];
        planetaryHourSymbolTextLayer.frame = self.contentView.layer.bounds;
        planetaryHourSymbolTextLayer.alignmentMode = kCAAlignmentCenter;
        
        [self.contentView.layer addSublayer:planetaryHourSymbolTextLayer];
    }
    return self;
}

- (void)prepareForReuse
{
    self.planetSymbol = @"";
}

- (void)setPlanetSymbol:(NSString *)planetSymbol
{
    _planetSymbol = [planetSymbol copy];
    planetaryHourSymbolTextLayer.string = self.planetSymbol;
}

- (NSString *)planetSymbol
{
    return self->_planetSymbol;
}

@end
