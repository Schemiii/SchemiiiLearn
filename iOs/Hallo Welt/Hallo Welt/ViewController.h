//
//  ViewController.h
//  Hallo Welt
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)btnAnimate:(id)sender;
- (IBAction)btnCopy:(id)sender;
- (IBAction)btnConvert:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtText;
@property (weak, nonatomic) IBOutlet UILabel *lblText;

@end
