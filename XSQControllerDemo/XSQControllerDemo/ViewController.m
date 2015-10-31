//
//  ViewController.m
//  XSQControllerDemo
//
//  Created by 徐霜晴 on 15/10/11.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "ViewController.h"
#import "XSQAnimatorObject.h"
#import "XSQDetailViewController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIButton *thumb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thumb = [[UIButton alloc] initWithFrame:CGRectMake(60, 60, 100, 100)];
    [self.thumb addTarget:self
                   action:@selector(handleButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.thumb setImage:[UIImage imageNamed:@"image.jpg"] forState:UIControlStateNormal];
    [self.thumb.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:self.thumb];
}

- (void)handleButtonPressed:(UIButton *)sender {
    
    XSQDetailViewController *presentedViewController = [[XSQDetailViewController alloc] init];
    presentedViewController.image = [UIImage imageNamed:@"image.jpg"];
    presentedViewController.transitioningDelegate = self;
    presentedViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:presentedViewController animated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source {
    return [[XSQAnimatorObject alloc] initWithThumbView:self.thumb];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[XSQAnimatorObject alloc] initWithThumbView:self.thumb];
}



@end
