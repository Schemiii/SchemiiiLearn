//
//  ViewController.h
//  ScrollViewDetailed
//
//  Created by Daniel Schmidt on 27.12.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgUks;

- (IBAction)PanGestureRecognizer : (UIPanGestureRecognizer*) gesture;
@end
