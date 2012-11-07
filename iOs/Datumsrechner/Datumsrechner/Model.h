//
//  Model.h
//  Datumsrechner
//
//  Created by Daniel Schmidt on 07.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Date.h"
@interface Model : NSObject

@property (nonatomic,readwrite,strong) Date *startDate;
@property (nonatomic,readwrite,strong) Date *endDate;

-(id) initWithDate:(Date*) newStartDate endDate:(Date*) newEndDate;
-(int) dayDifference;

@end
