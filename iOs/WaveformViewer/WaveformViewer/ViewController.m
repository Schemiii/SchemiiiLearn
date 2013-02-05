//
//  ViewController.m
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//
#define INITIALSIGNALTIMEUNITPX 5
#define MAXSIGNALTIMEUNITPX 15
#define MINSIGNALTIMEUNITPX 2


#import "ViewController.h"
#import "SignalView.h"

@interface ViewController ()
- (void) setSignalRectHeight:(CGFloat) height;
- (void) setSignalDrawHeight:(CGFloat) height;
@end

@implementation ViewController
@synthesize parser,signalRectHeight=_signalHeight,signalViewNameDict,signalDrawHeight=_signalDrawHeight,simTimeFrom,simTimeTo;

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSString *vcdFile = @"simple";
  self.signalRectHeight=60;
  self.signalDrawHeight=50;
  self.signalTimeUnitInPx=3;
  NSString *path = [[NSBundle mainBundle] pathForResource:vcdFile ofType:@"vcd"];
  self.parser = [[VCDParser alloc] initWithVCDFile:path];
  [self.parser parse];
  [self.signalTable setRowHeight:self.signalRectHeight];
  //Standard :
  self.simTimeFrom=0;
  self.simTimeTo=1000;
  
  CGFloat signalDisplayLengthPx=(self.simTimeTo-self.simTimeFrom)*self.signalTimeUnitInPx;
  self.signalScrView.contentSize = CGSizeMake(signalDisplayLengthPx, [[parser.signalDict allValues] count]*self.signalRectHeight);
  signalViewNameDict = [[NSMutableDictionary alloc]init];
  //For Each Signal create Signal Views,add them as Subviews and put the viewReference|View into the Dictionary.
  CGRect r;
  r.origin.x=0;
  r.size.height=self.signalRectHeight;
  self.signalGrid=[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  r.size.width=signalDisplayLengthPx;
  for(Signal *s in [parser.signalDict allValues]){
    SignalView *sv = [[SignalView alloc] initWithFrame:r andLineHeightInPx:self.signalDrawHeight];
    sv.signalName=s.name;
    sv.backgroundColor=[UIColor clearColor];
    sv.timeUnitLengthInPx=self.signalTimeUnitInPx;
    sv.simTimeFrom=self.simTimeFrom;
    sv.simTimeTo=self.simTimeTo;
    [self.signalScrView addSubview:sv]; 
    [signalViewNameDict setObject:sv forKey:s.name];
    r.origin.y+=self.signalRectHeight;
  }
  //Go through timesArray and update Signal Views with values
  NSArray *signals = [parser.signalDict allValues];
  for(NSNumber *time in parser.timesArray) {
    for(Signal *signal in signals)
    {
      NSString *value = [signal.valueDict objectForKey:time];
      if(value != NULL)
      {
        //Get SignalView reference
        SignalView* sv = [signalViewNameDict objectForKey:signal.name];
        [sv addSignalValue:value ForTime:time];
      }
    }
  }

  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) setSignalDrawHeight:(CGFloat)height{
  _signalDrawHeight=height;
}
- (void)setSignalRectHeight:(CGFloat)height{
  _signalHeight=height;
}
///**** UITableViewDataSourceDelegate Methods ***************************************
//Return Signalname in a UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *cell = [self.signalTable dequeueReusableCellWithIdentifier:@"Cell"];
  if(cell==nil){
    cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  }
  cell.textLabel.text=[[[self.parser.signalDict allValues] objectAtIndex:indexPath.row] name];
  return cell;
}
//Return the number of Elements in the Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [[parser.signalDict allValues] count];
}

//********************************************************************************************


///**** UIScrollViewDelegate Methods ************************************************
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  if(scrollView==self.signalScrView){
    [self.signalTable setContentOffset:CGPointMake(0,scrollView.contentOffset.y)];
  }
}
//********************************************************************************************

///**** UITableViewDelegate Methods ************************************************
//For dynamic drawing : draw line if cell will be displayed
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  
}
//********************************************************************************************

//**** Gesture Recognizers *******************************************************************
- (void)signalsDoubleTap:(UITapGestureRecognizer *)gesture{
  if(gesture.state == UIGestureRecognizerStateEnded){
    self.signalTimeUnitInPx=INITIALSIGNALTIMEUNITPX;
    [self updateSignalViewsWithNewSignalTime];
  }
}
- (void)signalSwipe:(UIPinchGestureRecognizer *)gesture{
  static CGFloat initialScaleValue=INITIALSIGNALTIMEUNITPX;
  if(gesture.state == UIGestureRecognizerStateBegan){
    initialScaleValue=self.signalTimeUnitInPx;
  }
  if(gesture.state == UIGestureRecognizerStateChanged){    
    self.signalTimeUnitInPx=gesture.scale*initialScaleValue;
    if(self.signalTimeUnitInPx>MAXSIGNALTIMEUNITPX)
      self.signalTimeUnitInPx=MAXSIGNALTIMEUNITPX;
    if(self.signalTimeUnitInPx<MINSIGNALTIMEUNITPX)
      self.signalTimeUnitInPx=MINSIGNALTIMEUNITPX;
    [self updateSignalViewsWithNewSignalTime];
  }
}
- (void)signalToogleTimeGrid:(UILongPressGestureRecognizer *)gesture{
  if(gesture.state==UIGestureRecognizerStateBegan){

  }
}
//********************************************************************************************

- (void) updateSignalViewsWithNewSignalTime{
  CGRect r;
  r.origin.x=0;
  r.size.height=self.signalRectHeight;
  r.size.width=(self.simTimeTo-self.simTimeFrom)*self.signalTimeUnitInPx;
  //Keep the order safe
  for (int i=0; i<[[self.parser.signalDict allValues] count]; i++) {
    NSString* sname=[[[self.parser.signalDict allValues] objectAtIndex:i]name];
    SignalView *sv=[self.signalViewNameDict objectForKey:sname];
    sv.frame=r;
    sv.timeUnitLengthInPx=self.signalTimeUnitInPx;
    r.origin.y+=self.signalRectHeight;
  }
   self.signalScrView.contentSize = CGSizeMake(r.size.width, [[parser.signalDict allValues] count]*self.signalRectHeight);
}

@end
