//
//  Date.m
//  Datumsrechner
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "Date.h"

@implementation Date

@synthesize date;

- (id)init{
  self = [super init];
  if(self){
    format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd.mm.yyyy"];
  }
  return self;
}

-(BOOL) dateFromNSString : (NSString*) inputString{
    self.date = [format dateFromString:inputString];
  if(self.date==nil)
    return NO;
  else
    return YES;
}

-(NSString*) description{
  if(date!=nil)
   return [format stringFromDate:date];
  else
    return nil;
}
@end
