//
//  SignalView.h
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignalView : UIView
@property (readonly,nonatomic)  CGFloat lineHeightPx;
@property (readwrite,nonatomic) CGFloat timeUnitLengthInPx;
- (void) setTimeUnitLengthInPx:(CGFloat)timeUnitLengthInPx;
- (void) addSignalValue : (NSString*) value ForTime : (NSNumber*) time;
- (void) clearSignalValues;
@end
