//
//  OptionViewController.h
//  WaveformViewer
//
//  Created by Daniel Schmidt on 25.03.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OptionDelegate
- (BOOL) willFinishWithStartSim : (NSInteger) start andEndSim : (NSInteger) endSim;
- (void) didFinishWithStartSim :(NSInteger) start andEndSim : (NSInteger) endSim;
@end
@interface OptionViewController : UIViewController
@property id<OptionDelegate> optiondelegate;
- (IBAction)finishEditingOptions:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtStart;
@property (weak, nonatomic) IBOutlet UITextField *txtEnd;

@end
