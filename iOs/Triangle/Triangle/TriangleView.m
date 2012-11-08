//
//  TriangleView.m
//  Triangle
//
//  Created by Daniel Schmidt on 08.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

@synthesize triangleCenter;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
#define CAVEMAN 1
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/

- (void)drawRect:(CGRect)rect
{
  // Set up Center, GroundLength and Height
  self.triangleCenter=CGPointMake(rect.origin.x+rect.size.width/2., rect.origin.y+rect.size.height/2.);
  //Setup for Black Triangle, filled with yellow Color
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 20.0);
  CGContextSetStrokeColorWithColor(context, [[UIColor blackColor]CGColor]);
  //Begin Path for Triangle
  CGContextBeginPath(context);
  //Move to left corner of the triangle

  CGContextMoveToPoint(context, self.triangleCenter.x-self.triangleGroundLength/2., self.triangleCenter.y+self.triangleHeight/2.);
  //Draw Groundside of Triangle
  CGContextAddLineToPoint(context, self.triangleCenter.x+self.triangleGroundLength/2., self.triangleCenter.y+self.triangleHeight/2.);
  //Draw to Top of the Triangle
  CGContextAddLineToPoint(context, self.triangleCenter.x, self.triangleCenter.y-self.triangleHeight/2.);
  CGContextClosePath(context);
  //Define a fill color
  CGContextSetFillColorWithColor(context, [[UIColor yellowColor]CGColor]);
  //Stroke and fill the path
  CGContextDrawPath(context, kCGPathFillStroke);
  //Add the exclamation mark
  CGContextBeginPath(context);
  //Move to center of the circle
  CGContextAddArc(context, self.triangleCenter.x, self.triangleCenter.y+85, 18, 0, 2*M_PI, YES);
  CGContextSetFillColorWithColor(context, [[UIColor redColor]CGColor]);
  CGContextDrawPath(context, kCGPathFill);
  CGContextBeginPath(context);
  CGContextSetLineWidth(context, 40.0);
  CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
  CGContextMoveToPoint(context, self.triangleCenter.x, self.triangleCenter.y-60);
  CGContextAddLineToPoint(context, self.triangleCenter.x, self.triangleCenter.y+35);
  CGContextDrawPath(context, kCGPathStroke);
}


@end
