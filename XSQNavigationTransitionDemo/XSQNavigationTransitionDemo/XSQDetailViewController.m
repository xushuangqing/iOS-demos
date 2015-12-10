//
//  XSQDetailViewController.m
//  XSQNavigationTransitionDemo
//
//  Created by 徐霜晴 on 15/11/27.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "XSQDetailViewController.h"

@interface XSQDetailViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation XSQDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:self.panGestureRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"XSQDetailViewController viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"XSQDetailViewController viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"XSQDetailViewController viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"XSQDetailViewController viewDidDisappear");
}

#pragma mark - Accessor Methods

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    static CGFloat beginY;
    CGFloat currentY = [gestureRecognizer translationInView:window].y;
    CGFloat percent = (currentY - beginY) / CGRectGetHeight(window.bounds);
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            beginY = [gestureRecognizer translationInView:window].y;
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:
            [self.interactiveTransition updateInteractiveTransition:percent];
            break;
        case UIGestureRecognizerStateEnded:
            if (percent > 0.5) {
                [self.interactiveTransition finishInteractiveTransition];
            }
            else {
                [self.interactiveTransition cancelInteractiveTransition];
            }
            break;
        default:
            break;
    }
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    NSLog(@"XSQDetailViewController willMoveToParentViewController %@", parent);
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    NSLog(@"XSQDetailViewController didMoveToParentViewController %@", parent);
}

@end


