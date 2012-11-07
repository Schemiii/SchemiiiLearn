//
//  Date.m
//  Datumsrechner
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "Date.h"

@implementation Date

@synthesize date=_date;

- (id)init{
  self = [super init];
  if(self){
    format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd.MM.yyyy"];
  }
  return self;
}
- (void)setDate:(NSDate *)date{
  //Convert to absolute days
  NSString *tmp;
  tmp=[format stringFromDate:date];
  self->_date=[format dateFromString:tmp];
  self->_date=date;
}
-(BOOL) dateFromNSString : (NSString*) inputString{
    self.date = [format dateFromString:inputString];
  if(self.date==nil)
    return NO;
  else
    return YES;
}

-(NSString*) description{
  if(_date!=nil)
   return [format stringFromDate:_date];
  else
    return nil;
}
@end
