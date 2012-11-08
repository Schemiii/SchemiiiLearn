//
//  ViewController.h
//  AnimateFruits
//
//  Created by Daniel Schmidt on 08.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *apple;
@property (weak, nonatomic) IBOutlet UIImageView *cherry;
@property (weak, nonatomic) IBOutlet UIImageView *orange;
@property (weak, nonatomic) IBOutlet UIImageView *melon;

- (IBAction)btnAnimate :(id)sender;

@end
