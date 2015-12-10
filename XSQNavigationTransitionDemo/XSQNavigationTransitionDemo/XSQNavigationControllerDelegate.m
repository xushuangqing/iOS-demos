//
//  XSQNavigationControllerDelegate.m
//  XSQNavigationTransitionDemo
//
//  Created by 徐霜晴 on 15/11/29.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "XSQNavigationControllerDelegate.h"
#import "XSQShrinkAnimatorObject.h"
#import "XSQExpandAnimatorObject.h"
#import "XSQDetailViewController.h"
#import "XSQMasterViewController.h"

@interface XSQNavigationControllerDelegate ()

@property (nonatomic, strong) XSQShrinkAnimatorObject *shrinkAnimator;
@property (nonatomic, strong) XSQExpandAnimatorObject *expandAnimator;

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation XSQNavigationControllerDelegate

- (UIPercentDrivenInteractiveTransition *)interactiveTransition {
    if (!_interactiveTransition) {
        _interactiveTransition = [UIPercentDrivenInteractiveTransition new];
    }
    return _interactiveTransition;
}

#pragma mark - UINavigationControllerDelegate;

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    
    if (animationController == self.shrinkAnimator) {
        return self.interactiveTransition;
    }
    return nil;
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPop && [fromVC isKindOfClass:[XSQDetailViewController class]] && [toVC isKindOfClass:[XSQMasterViewController class]]) {
        
        XSQDetailViewController *detailViewController = (XSQDetailViewController *)fromVC;
        [self.interactiveTransition updateInteractiveTransition:0];
        detailViewController.interactiveTransition = self.interactiveTransition;
        
        XSQMasterViewController *masterViewController = (XSQMasterViewController *)toVC;
        
        if (!self.shrinkAnimator) {
            self.shrinkAnimator = [[XSQShrinkAnimatorObject alloc] initWithThumbView:masterViewController.thumbView];
        }
        return self.shrinkAnimator;
    }
    
    if (operation == UINavigationControllerOperationPush && [fromVC isKindOfClass:[XSQMasterViewController class]] && [toVC isKindOfClass:[XSQDetailViewController class]]) {
        
        XSQMasterViewController *masterViewController = (XSQMasterViewController *)fromVC;
        
        if (!self.expandAnimator) {
            self.expandAnimator = [[XSQExpandAnimatorObject alloc] initWithThumbView:masterViewController.thumbView];
        }
        return self.expandAnimator;
    }
    
    return nil;
}

@end
