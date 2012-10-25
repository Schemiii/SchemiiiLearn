//
//  Number.m
//  Converter
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "Number.h"

@implementation Number
@synthesize value;
- (id)initWithInt:(int)x{
  self = [super init];
  if(self){
    self.value=x;
  }
  return self;
}
@end
