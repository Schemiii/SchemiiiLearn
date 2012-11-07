//
//  DateModel.h
//  
//
//  Created by Daniel Schmidt on 02.11.12.
//
//

#import <Foundation/Foundation.h>
#import "Date.h"
@interface DateModel : NSObject

@property (nonatomic,readwrite,strong) Date *startDate;
@property (nonatomic,readwrite,strong) Date *endDate;

-(id) initWithNSDate:(NSDate*) startDate endDate:(NSDate*)endDate;
-(id) initWithDate:(Date*) startDate endDate:(Date*) endDate;
-(int) dayDifference;

@end
