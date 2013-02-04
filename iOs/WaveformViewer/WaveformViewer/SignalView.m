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
@synthesize cgPoints,timeUnitLengthInPx=_timeUnitLengthInPx,lastPoint,lineHeightPx=_lineHeightPx;
- (id)initWithFrame:(CGRect)frame andLineHeightInPx : (CGFloat) lineHeight
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      self.cgPoints = [[NSMutableArray alloc] initWithCapacity:20];
      self.lastPoint=CGPointMake(0, -2);
      _lineHeightPx=lineHeight;
    }
    return self;
}
- (void)setTimeUnitLengthInPx:(CGFloat)timeUnitLengthInPx{
  _timeUnitLengthInPx=timeUnitLengthInPx;
  [self setNeedsDisplay];
}
- (void) addSignalValue : (NSString*) value ForTime : (NSNumber*) time{
  if([value isEqualToString:@"0"]){
    [self.cgPoints
     addObject:[NSValue valueWithCGPoint:CGPointMake([time floatValue],0)]];
  }else if ([value isEqualToString:@"1"]){
    [self.cgPoints
     addObject:[NSValue valueWithCGPoint:CGPointMake([time floatValue],1)]];
  }else if([value isEqualToString:@"z"]){
    [self.cgPoints
     addObject:[NSValue valueWithCGPoint:CGPointMake([time floatValue],-1)]];
  }else if([value isEqualToString:@"x"]){
    [self.cgPoints
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
  
  CGContextBeginPath(context);
  // Move through signalpoint list and draw
  for (NSValue *val in self.cgPoints) {
    CGPoint p =[val CGPointValue];
    if(lastPoint.x==p.x){//Erster Punkt oder Änderung ohne Zeitvergehen
      if(p.y==0){//Signal startet bei LOW
        CGContextMoveToPoint(context, 0,rect.size.height);
      }else if(p.y==1){//Signal startet bei HIGH
        CGContextMoveToPoint(context, 0,0);
      }else { //Signal undefiniert oder hochohmig
        CGContextMoveToPoint(context, 0,rect.size.height/2.);
      }
      lastPoint=p;
    }else{ //Neuer Punkt
      if(p.y>=0) {//Signal ist definiert
        if(lastPoint.y>=0){//letzter Zeitpunkt war definiert
          //Zeichne Linie auf letzter Höhe bis zum aktuellen x
          CGContextAddLineToPoint(context, p.x*self.timeUnitLengthInPx, lastPoint.y*self.lineHeightPx);
          CGContextAddLineToPoint(context, p.x*self.timeUnitLengthInPx, p.y*self.lineHeightPx);
        }
        else{ //letzter Punkt war undefiniert
        }
      }
      else { //Signal undefiniert oder hochohmig
        CGContextMoveToPoint(context, 0,rect.size.height/2.);
      }
      lastPoint=p;
    }
    //Für jeden Abschnitt, zeichne Pfad
    
  }
  CGContextStrokePath(context);
}


@end
