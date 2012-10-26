//
//  LengthCalculator.m
//  Laengenrechner
//
//  Created by Daniel Schmidt on 26.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "LengthCalculator.h"

#define METERTOCENTIMETER 100.
#define INCHTOCENTIMETER  2.54
#define FOOTTOCENTIMETER  30.48
@implementation LengthCalculator

- (bool)setInput:(NSString *)inputString{
  float i;char ts[2];
  isValid=false;
  if(EOF != sscanf([inputString UTF8String], [@"%f %s" UTF8String],&i,ts)){
    switch (ts[0]) {
      case 'm':
        isValid=true;
        meters=i;
        centimeters=i*METERTOCENTIMETER;
        inches = centimeters/INCHTOCENTIMETER;
        foot = centimeters/FOOTTOCENTIMETER;
        break;
      case 'c':
        if(ts[1]=='m'){
          isValid=true;
          centimeters=i;
          meters=i/100.;
          inches=centimeters/INCHTOCENTIMETER;
          foot=centimeters/FOOTTOCENTIMETER;
        }
        break;
      case 'f':
        if(ts[1]=='t'){
          isValid=true;
          foot=i;
          centimeters=i*FOOTTOCENTIMETER;
          meters=centimeters/METERTOCENTIMETER;
          inches=centimeters/INCHTOCENTIMETER;
        }
        break;
      case 'i':
        if(ts[1]=='n'){
          inches=i;
          centimeters=i*INCHTOCENTIMETER;
          foot=centimeters/FOOTTOCENTIMETER;
          meters=centimeters/METERTOCENTIMETER;
        }
          isValid=true;
        break;
      default:
        NSLog(@"No Proper Input at LengthCalculator :: inputString\n");
        break;
    }
  }
  return isValid;
}
- (NSString *)getMeter{
  if(isValid){
    NSLog(@"Calling GetMeter.. Result is : %f",meters);
    return [NSString stringWithFormat:@"%f m",meters];
  }
  else{
    NSLog(@"Calling GetMeters without valid inputString \n");
    return @"Invalid Input";
  }
}
- (NSString *)getCentimeter{
  if(isValid){
    NSLog(@"Calling getCentimeter.. Result is : %f",centimeters);
    return [NSString stringWithFormat:@"%f cm",centimeters];
  }
  else{
    NSLog(@"Calling getCentimeter without valid inputString \n");
    return @"Invalid Input";
  }
}
- (NSString *)getInch{
  if(isValid){
    NSLog(@"Calling getInch.. Result is : %f",inches);
    return [NSString stringWithFormat:@"%f in",inches];
  }
  else{
    NSLog(@"Calling getInch without valid inputString \n");
    return @"Invalid Input";
  }
}
- (NSString *)getFoot{
  if(isValid){
    NSLog(@"Calling getFoot.. Result is : %f \n",foot);
    return [NSString stringWithFormat:@"%f ft",foot];
  }else{
    NSLog(@"Calling getFoot without valid inputString \n");
    return @"Invalid Input";
  }
}
@end
