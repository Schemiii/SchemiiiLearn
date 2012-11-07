//
//  DateModel.m
//  
//
//  Created by Daniel Schmidt on 02.11.12.
//
//

#import "DateModel.h"

@implementation DateModel

@synthesize startDate,endDate;

-(id) initWithNSDate:(NSDate*) startDate endDate:(NSDate*)endDate{
  self = [super init];
  if(self){
    
  }
  return self;
}
-(id) initWithDate:(Date*) startDate endDate:(Date*) endDate{
  self = [super init];
  if(self){
    
  }
  return self;

}
-(int) dayDifference{
  return 1;
}


@end
