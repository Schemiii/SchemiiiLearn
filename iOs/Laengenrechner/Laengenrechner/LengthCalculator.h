//
//  LengthCalculator.h
//  Laengenrechner
//
//  Created by Daniel Schmidt on 26.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LengthCalculator : NSObject{
  float meters;
  float centimeters;
  float inches;
  float foot;
  bool isValid;
}

- (bool) setInput : (NSString*) inputString;
- (NSString*) getMeter;
- (NSString*) getCentimeter;
- (NSString*) getInch;
- (NSString*) getFoot;
@end
