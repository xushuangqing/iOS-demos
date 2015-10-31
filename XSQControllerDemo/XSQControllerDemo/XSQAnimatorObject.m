//
//  XSQAnimatorObject.m
//  XSQControllerDemo
//
//  Created by 徐霜晴 on 15/10/18.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "XSQAnimatorObject.h"

@interface XSQAnimatorObject ()

@property (nonatomic, strong) UIView *thumbView;

@end

@implementation XSQAnimatorObject

- (id)initWithThumbView:(UIView *)thumbView {
    if (self = [super init]) {
        _thumbView = thumbView;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    CGRect thumbFrame = [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
    
    if (toVC.isBeingPresented) {
        
        [toView setFrame:thumbFrame];
        [[transitionContext containerView] addSubview:toView];
        
        CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             [toView setFrame:toViewFinalFrame];
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
    else if (fromVC.isBeingDismissed) {
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             [fromView setFrame:thumbFrame];
                         }
                         completion:^(BOOL finished) {
                             [fromView removeFromSuperview];
                             [transitionContext completeTransition:YES];
                         }];
    }
}

- (void)animationEnded:(BOOL)transitionCompleted {
    
}

@end
