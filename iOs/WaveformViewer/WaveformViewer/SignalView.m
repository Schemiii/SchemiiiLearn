//
//  SignalView.m
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import "SignalView.h"
@interface SignalView()
@property (readwrite,nonatomic) NSMutableArray *cgPoints;
@property (readwrite,nonatomic) CGPoint lastPoint;
@end

@implementation SignalView
@synthesize cgPoints,timeUnitLengthInPx=_timeUnitLengthInPx,lastPoint;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      self.lastPoint=CGPointMake(0, -2);
    }
    return self;
}
- (void)setTimeUnitLengthInPx:(CGFloat)timeUnitLengthInPx{
  _timeUnitLengthInPx=timeUnitLengthInPx;
  [self setNeedsDisplay];
}
- (void) addSignalValue : (NSString*) value ForTime : (NSNumber*) time{
  if([value isEqualToString:@"0"]){
    [cgPoints
     addObject:[NSValue valueWithCGPoint:CGPointMake([time floatValue],0)]];
  }else if ([value isEqualToString:@"1"]){
    [cgPoints
     addObject:[NSValue valueWithCGPoint:CGPointMake([time floatValue],1)]];
  }else if([value isEqualToString:@"z"]){
    [cgPoints
     addObject:[NSValue valueWithCGPoint:CGPointMake([time floatValue],-1)]];
  }else if([value isEqualToString:@"x"]){
    [cgPoints
     addObject:[NSValue valueWithCGPoint:CGPointMake([time floatValue],-2)]];
  }
}

- (void) clearSignalValues{
  
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  [super drawRect:rect];
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 2.0);
  
  CGContextMoveToPoint(context, 0,rect.size.height);
  // Move through signalpoint list and draw
  for (NSValue *val in cgPoints) {
    CGPoint p =[val CGPointValue];
    if(lastPoint.x!=p.x){
      //Zeit ist vergangen. Wir müssen den letzten Wert bis zum aktuellen x zeichnen.
    }
    //Zeichne zum neuen Wert
    if(p.y>=0){
      
    }else{
      if(p.y==-1){//hochohmig
        
      }else if(p.y==-2){//undefiniert
        
      }
      //Value is undefined or ..
    }
    
    
  }

  
  CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
  
  
  
  CGContextStrokePath(context);
  
}


@end
