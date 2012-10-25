//
//  BinConverter.m
//  Converter
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "BinConverter.h"

@implementation BinConverter
- (NSString *)convert{
  //Convert Value to Binary Value the handy way
  NSMutableString *bin = [[NSMutableString alloc] initWithString:@""];
  for(NSInteger n = self.value; n > 0; n = n>>1){
    //Shift number to right until its zero and test if one or zero.
    [bin insertString:((n & 1) ? @"1" : @"0") atIndex:0];
  }
  return bin;
}
@end
