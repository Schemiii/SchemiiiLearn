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
@synthesize cgPoints,timeUnitLengthInPx=_timeUnitLengthInPx,lastPoint,lineHeightPx=_lineHeightPx,signalName,simTimeFrom,simTimeTo;
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
- (void) drawIntervallFromPoint : (CGPoint) fPoint toPoint :(CGPoint) tPoint inContext :(CGContextRef) context{
  CGContextBeginPath(context);
  //Beide definiert
  if(fPoint.y>=0&&tPoint.y>=0){
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
      //Gleiche Höhe
    if(fPoint.y==tPoint.y){
      if(fPoint.y==0){
        CGContextMoveToPoint(context, fPoint.x, self.lineHeightPx);
        CGContextAddLineToPoint(context, tPoint.x, self.lineHeightPx);
      }else{
        CGContextMoveToPoint(context, fPoint.x, 0);
         CGContextAddLineToPoint(context, tPoint.x, 0);
      }
    }//Ungleiche Höhe
    else{
      CGContextSetLineWidth(context, 2.0);
      CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
      if(fPoint.y==0){
        CGContextMoveToPoint(context, fPoint.x, self.lineHeightPx);
        CGContextAddLineToPoint(context, tPoint.x, self.lineHeightPx);
        CGContextAddLineToPoint(context, tPoint.x, 0);
      }else{
        CGContextMoveToPoint(context, fPoint.x, 0);
        CGContextAddLineToPoint(context, tPoint.x, 0);
        CGContextAddLineToPoint(context, tPoint.x, self.lineHeightPx);
      }
    }
  }//Undefiniert nach definiert
  else if(fPoint.y==-2&&tPoint.y>=0){
    CGContextSetStrokeColorWithColor(context, [[UIColor yellowColor] CGColor]);
    CGContextSetLineWidth(context, 5.0);
//Teile die undefinierte Strecke in n gleich breite wie hohe teilstrecken
    int n = floor(tPoint.x-fPoint.x)/self.lineHeightPx;
    CGContextMoveToPoint(context, fPoint.x, 0);
//Zeichne in jede volle Teilstrecke gelbe linien, die andeuten, dass der wert undefiniert ist.
    for (int i=0;i<=n;i++){
      CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx);
      CGContextMoveToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx);
      CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), 0);
    }
    if(tPoint.y==0)
      CGContextAddLineToPoint(context, tPoint.x, self.lineHeightPx);
    else
      CGContextAddLineToPoint(context, tPoint.x, 0);
  }//Definiert nach undefiniert
  else if(fPoint.y>=0&&tPoint.y==-2){
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    if(fPoint.y==0){
      CGContextMoveToPoint(context, fPoint.x, self.lineHeightPx);
      CGContextAddLineToPoint(context, tPoint.x, self.lineHeightPx);
    }else{
      CGContextMoveToPoint(context, fPoint.x, 0);
      CGContextAddLineToPoint(context, tPoint.x, 0);
    }
      
  }//Hochohmig nach definiert
  else if(fPoint.y==-1&&tPoint.y>=0){
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineWidth(context, 5.0);
    //Teile die undefinierte Strecke in n gleich breite wie hohe teilstrecken
    int n = floor(tPoint.x-fPoint.x)/self.lineHeightPx;
    CGContextMoveToPoint(context, fPoint.x, 0);
    //Zeichne in jede volle Teilstrecke gelbe linien, die andeuten, dass der wert undefiniert ist.
    for (int i=0;i<=n;i++){
      if(i==0){
        CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx/3.);
        CGContextMoveToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx);
        CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), 0);
      }else{
        CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx/3.);
        CGContextMoveToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx/3.);
        CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), 0);
      }

    }
    if(tPoint.y==0)
      CGContextAddLineToPoint(context, tPoint.x, self.lineHeightPx);
    else
      CGContextAddLineToPoint(context, tPoint.x, 0);
  }//definiert nach hochohmig
  else if(fPoint.y>=0&&tPoint.y==-1){
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    if(fPoint.y==0){
      CGContextMoveToPoint(context, fPoint.x, self.lineHeightPx);
      CGContextAddLineToPoint(context, tPoint.x, self.lineHeightPx);
    }else{
      CGContextMoveToPoint(context, fPoint.x, 0);
      CGContextAddLineToPoint(context, tPoint.x, 0);
    }
  }//undefiniert nach hochohmig
  else if(fPoint.y==-2 && tPoint.y==-1){
    CGContextSetStrokeColorWithColor(context, [[UIColor yellowColor] CGColor]);
    CGContextSetLineWidth(context, 5.0);
    //Teile die undefinierte Strecke in n gleich breite wie hohe teilstrecken
    int n = floor(tPoint.x-fPoint.x)/self.lineHeightPx;
    CGContextMoveToPoint(context, fPoint.x, 0);
    //Zeichne in jede volle Teilstrecke gelbe linien, die andeuten, dass der wert undefiniert ist.
    for (int i=0;i<=n;i++){
      CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx);
      CGContextMoveToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx);
      CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), 0);
    }
    //Zeichne das letzte Teilstück
    CGContextAddLineToPoint(context, tPoint.x, 0);
  }//hochohmig nach undefiniert
  else if(fPoint.y==-1&&tPoint.y==-2){
    NSLog(@"Hochohmig nach definiert");
  }else if(fPoint.y==-2&&tPoint.y==-2){
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineWidth(context, 5.0);
    //Teile die undefinierte Strecke in n gleich breite wie hohe teilstrecken
    int n = floor(tPoint.x-fPoint.x)/self.lineHeightPx;
    CGContextMoveToPoint(context, fPoint.x, 0);
    //Zeichne in jede volle Teilstrecke gelbe linien, die andeuten, dass der wert undefiniert ist.
    for (int i=0;i<=n;i++){
      if(i==0){
        CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx/3.);
        CGContextMoveToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx);
        CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), 0);
      }else{
        CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx/3.);
        CGContextMoveToPoint(context, fPoint.x+(self.lineHeightPx*i), self.lineHeightPx/3.);
        CGContextAddLineToPoint(context, fPoint.x+(self.lineHeightPx*i), 0);
      }
    }
    CGContextAddLineToPoint(context,tPoint.x,0);
  }else if(fPoint.y==-1&&tPoint.y==-1){
    NSLog(@"undef nach undef");
  }
  
  
  CGContextStrokePath(context);
}


- (void)drawRect:(CGRect)rect
{
  [super drawRect:rect];
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 2.0);
  
  if([self.cgPoints count]>0){
    for (int i=0; i<[self.cgPoints count]-1; i++) {
      //Draw every Pair of Points
      CGPoint from,to;
//      NSLog(@"from : %f to : %f",self.simTimeFrom,self.simTimeTo);
//      NSLog(@"pointfromt : %f pointtot : %f",[[self.cgPoints objectAtIndex:i] CGPointValue].x,[[self.cgPoints objectAtIndex:i+1] CGPointValue].x);
      
      //Get two corresponding points
      from=CGPointMake([[self.cgPoints objectAtIndex:i]CGPointValue].x, [[self.cgPoints objectAtIndex:i]CGPointValue].y);
      to=CGPointMake([[self.cgPoints objectAtIndex:i+1]CGPointValue].x, [[self.cgPoints objectAtIndex:i+1]CGPointValue].y);
      //Only plot them if in interval to be plotted.
      //Pair not in interval
      if(self.simTimeFrom>to.x || self.simTimeTo<from.x)
        continue;
      
      //from not in interval, to is
      if(from.x<self.simTimeFrom&&to.x<=self.simTimeTo&&to.x>=self.simTimeFrom){
        from.x=self.simTimeFrom;
      }//from in interval, to not
      else if(from.x>=self.simTimeFrom&&from.x<=self.simTimeTo&&to.x>self.simTimeTo){
        to.x=self.simTimeTo;
      }//both points in interval
      //Scaling
      from.x*=self.timeUnitLengthInPx;
      to.x*=self.timeUnitLengthInPx;
      [self drawIntervallFromPoint:from toPoint:to inContext:context];
    
    }
    //Manually add a last Point
    
    CGPoint from=CGPointMake([[self.cgPoints lastObject] CGPointValue].x, [[self.cgPoints lastObject] CGPointValue].y);
    if(from.x<=self.simTimeTo){
      if(from.x<self.simTimeFrom)
        from.x=self.simTimeFrom;
      from.x*=self.timeUnitLengthInPx;
      [self drawIntervallFromPoint:from
                           toPoint:CGPointMake(self.simTimeTo*self.timeUnitLengthInPx, [[self.cgPoints lastObject] CGPointValue].y) inContext:context];
    }
  }
  
}


@end
