//
//  Date.h
//  Datumsrechner
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date : NSObject{
@private
  NSDateFormatter* format;
}

@property(nonatomic,readwrite,strong) NSDate *date;

-(BOOL) dateFromNSString : (NSString*) inputString;

- (NSString *)description;

@end
