//
//  SignalView.h
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignalView : UIView
@property (readonly,nonatomic)  CGFloat lineHeightPx;
@property (readwrite,nonatomic) CGFloat timeUnitLengthInPx;
@property (readwrite,nonatomic) NSString *signalName;
@property CGFloat simTimeFrom,simTimeTo;
- (id)initWithFrame:(CGRect)frame andLineHeightInPx : (CGFloat) lineHeight;
- (void) setTimeUnitLengthInPx:(CGFloat)timeUnitLengthInPx;
- (void) addSignalValue : (NSString*) value ForTime : (NSNumber*) time;
- (void) clearSignalValues;
@end

/*
 bool first=YES;
 for (NSValue *val in self.cgPoints) {
 if(first){
 if([val CGPointValue].y==0){
 CGContextMoveToPoint(context, 0, self.lineHeightPx);
 first=NO;
 }
 else if([val CGPointValue].y==1){
 CGContextMoveToPoint(context, 0, 0);
 first=NO;
 }else if([val CGPointValue].y==-1){//Hochohmig
 //TODO Darstellung überlegen
 }else if([val CGPointValue].y==-2){//Undefinierter Zustand
 //Bei einem undefinierten Zustand wird kein Signal gezeichnet
 }
 lastPoint=[val CGPointValue];
 }else{
 CGPoint p=[val CGPointValue];
 //letzter Punkt war in y ungleich dem aktuellen,korrigier
 if(lastPoint.y!=p.y){
 if(lastPoint.y>=0 && p.y>=0){
 if(p.y==0){
 CGContextAddLineToPoint(context, lastPoint.x*self.timeUnitLengthInPx, self.lineHeightPx);
 }else if(p.y==1){
 CGContextAddLineToPoint(context, lastPoint.x*self.timeUnitLengthInPx, 0);
 }
 }else if (lastPoint.y==-2&&p.y>=0){
 if(p.y==0)
 CGContextMoveToPoint(context, p.x*self.timeUnitLengthInPx, p.y);
 else if(p.y==1)
 CGContextMoveToPoint(context, p.x*self.timeUnitLengthInPx, p.y);
 }else if(lastPoint.y>=0&&p.y==-2){
 
 }
 }
 //Zeichne mit p.y bis zum aktuellen x
 if(p.y==0){
 CGContextAddLineToPoint(context, p.x*self.timeUnitLengthInPx, self.lineHeightPx);
 }
 else if(p.y==1){
 CGContextAddLineToPoint(context, p.x*self.timeUnitLengthInPx, 0);
 }else if(p.y==-1){
 //TODO Darstellung überlegen
 }else if(p.y==-2){
 //TODO Darstellung überlegen
 }
 lastPoint=p;
 }
 }
 //Zeichne bis zum Ende des Rects mit dem aktuelle Wert
 if(lastPoint.y==0){
 CGContextAddLineToPoint(context, rect.size.width, self.lineHeightPx);
 }else if(lastPoint.y==1){
 CGContextAddLineToPoint(context, rect.size.width, 0);
 }else if(lastPoint.y==-1){
 //TODO Darstellung überlegen
 }else if(lastPoint.y==-2){
 //TODO Darstellung überlegen
 }
 */