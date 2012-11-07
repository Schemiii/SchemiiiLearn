//
//  Model.m
//  Datumsrechner
//
//  Created by Daniel Schmidt on 07.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "Model.h"

@implementation Model
@synthesize startDate,endDate;

-(id) initWithDate:(Date*) newStartDate endDate:(Date*) newEndDate{
  self = [super init];
  if(self){
    self.startDate=newStartDate;
    self.endDate=newEndDate;
  }
  return self;
  
}
-(int) dayDifference{
 return ([endDate.date timeIntervalSinceDate:startDate.date]/60/60/24);
}

-(NSString*) description{
  return [NSString stringWithFormat:@"StartDate : %@ , EndDate : %@",startDate,endDate];
}
@end
