//
//  ViewController.h
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *signalTable;

@end
