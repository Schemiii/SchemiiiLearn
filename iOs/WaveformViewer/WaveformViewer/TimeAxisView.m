//
//  TimeAxisView.m
//  WaveformViewer
//
//  Created by Daniel Schmidt on 24.03.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import "TimeAxisView.h"

@implementation TimeAxisView
@synthesize enabled,min,max,dx;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) enable{
  enabled=YES;
}
- (void) disable{
  enabled=NO;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect{
  // Drawing code
  if(enabled){
    //Zeichne im Abstand dx horizontale Linie
    //Beschrifte die Linie mit min + i*max/dx
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextMoveToPoint(context, 0, 0);
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextSelectFont(context, "Helvetica", 10.0, kCGEncodingMacRoman);
    CGContextSetCharacterSpacing(context, 1.7);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    //Display 20 bars
    for (int i=0;i<20;i++){
      CGContextMoveToPoint(context,i*rect.size.width/20, 20);
      CGContextAddLineToPoint(context, i*rect.size.width/20, rect.size.height);
      //Calculate the right  time interval
      NSString *text=[NSString stringWithFormat:@"%d",min+i*((max-min)/20)];
      CGContextShowTextAtPoint(context, i*rect.size.width/20, 10, [text cStringUsingEncoding:NSASCIIStringEncoding] , [text length]);
      
    }
    CGContextStrokePath(context);
  }else{
   
  }
}


@end
