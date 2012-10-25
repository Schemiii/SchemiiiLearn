//
//  Number.h
//  Converter
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Number : NSObject

@property (readwrite) int value;

-(id) initWithInt : (int) x;
@end
