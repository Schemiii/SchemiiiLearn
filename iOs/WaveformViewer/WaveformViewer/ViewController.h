//
//  ViewController.h
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCDParser.h"

@interface ViewController : UIViewController<UITableViewDataSource,UIScrollViewDelegate>
@property (weak,nonatomic)  IBOutlet UIScrollView *signalScrView;
@property (weak,nonatomic)  IBOutlet UITableView *signalTable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *signalTableWidth;
@property (strong,nonatomic) VCDParser *parser;
@property BOOL timerswitch;
@property (readonly,nonatomic) CGFloat signalRectHeight;
@property (readonly,nonatomic) CGFloat signalDrawHeight;
@property (readwrite,nonatomic) CGFloat signalTimeUnitInPx;
@property (readwrite,nonatomic) CGFloat signalLength;

@property (strong,nonatomic) NSMutableDictionary *signalViewNameDict;
@property CGFloat simTimeFrom,simTimeTo;

-(IBAction) signalsDoubleTap : (UITapGestureRecognizer*) gesture;
-(IBAction) signalsSingleTap : (UITapGestureRecognizer*) gesture;

-(IBAction) signalSwipe : (UIPinchGestureRecognizer*) gesture;

-(IBAction) signalToogleTimeGrid : (UILongPressGestureRecognizer*) gesture;
-(IBAction) signalToogleTime : (UILongPressGestureRecognizer*) gesture;
-(IBAction) signalRotation : (UIRotationGestureRecognizer*) gesture;

@end
