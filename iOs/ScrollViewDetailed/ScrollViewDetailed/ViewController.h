//
//  ViewController.h
//  ScrollViewDetailed
//
//  Created by Daniel Schmidt on 27.12.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *appleScroll;
@property (weak, nonatomic) IBOutlet UIImageView *applePic;

@property (weak, nonatomic) IBOutlet UIScrollView *cherryPic;
@property (weak, nonatomic) IBOutlet UIScrollView *cherryScroll;

@end
