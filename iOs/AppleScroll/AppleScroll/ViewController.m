//
//  ViewController.m
//  AppleScroll
//
//  Created by Daniel Schmidt on 08.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.scrollApple.contentSize=CGSizeMake(1280, 1024);
  self.scrollApple.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
  return self.apple;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
  NSLog(@"Scroll View Begin Zoom");
  }
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
  NSLog(@"Scroll View Did Zoom");
}
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
  NSLog(@"Scrollview did scroll");
}
- (void) scrollViewDidScrollToTop:(UIScrollView *)scrollView{
  NSLog(@"Scrollview didscrolltotop");
}
@end
