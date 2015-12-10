//
//  XSQNavigationController.m
//  XSQNavigationTransitionDemo
//
//  Created by 徐霜晴 on 15/11/27.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "XSQNavigationController.h"
#import "XSQNavigationControllerDelegate.h"

@interface XSQNavigationController ()

@property (nonatomic, strong) XSQNavigationControllerDelegate *navigationDelegate;

@end

@implementation XSQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _navigationDelegate = [XSQNavigationControllerDelegate new];
    self.delegate = _navigationDelegate;
    
    self.navigationBarHidden = YES;
}

- (NSArray *)childViewControllers {
    return [super childViewControllers];
}

- (void)addChildViewController:(UIViewController *)childController {
    [super addChildViewController:childController];
}

@end
