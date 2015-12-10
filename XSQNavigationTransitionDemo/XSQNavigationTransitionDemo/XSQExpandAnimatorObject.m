//
//  XSQExpandAnimatorObject.m
//  XSQNavigationTransitionDemo
//
//  Created by 徐霜晴 on 15/11/30.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "XSQExpandAnimatorObject.h"

@interface XSQExpandAnimatorObject ()

@property (nonatomic, weak) UIView *thumbView;

@end

@implementation XSQExpandAnimatorObject

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
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    CGRect thumbFrame = [[transitionContext containerView] convertRect:self.thumbView.bounds fromView:self.thumbView];
    [toView setFrame:thumbFrame];

    [[transitionContext containerView] addSubview:toView];
     
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         [toView setFrame:toViewFinalFrame];
                     }
                     completion:^(BOOL finished) {
                         if (![transitionContext transitionWasCancelled]) {
                             [fromView removeFromSuperview];
                             [transitionContext completeTransition:YES];
                         }
                         else {
                             [toView removeFromSuperview];
                             [transitionContext completeTransition:NO];
                         }
                     }];
}

- (void)animationEnded:(BOOL)transitionCompleted {
    
}


@end
