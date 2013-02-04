//
//  ViewController.h
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCDParser.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak,nonatomic)  IBOutlet UIScrollView *signalScrView;

@property (weak,nonatomic)  IBOutlet UITableView *signalTable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *signalTableWidth;

@property (strong,nonatomic) VCDParser *parser;
@property (readonly,nonatomic) CGFloat signalHeight;
@property (readwrite,nonatomic) CGFloat signalTimeUnitInPx;
@property (readwrite,nonatomic) CGFloat signalLength;
@property (strong,nonatomic) NSMutableDictionary *signalViewNameDict;

@end
