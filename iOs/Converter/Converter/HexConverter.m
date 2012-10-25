//
//  HexConverter.m
//  Converter
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "HexConverter.h"

@implementation HexConverter

- (NSString *)convert{
  //Convert value to Hex Value
  return [[NSString alloc] initWithFormat:@"0x%x", self.value];
}
@end
