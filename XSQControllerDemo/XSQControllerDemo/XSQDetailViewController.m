//
//  XSQDetailViewController.m
//  XSQControllerDemo
//
//  Created by 徐霜晴 on 15/10/20.
//  Copyright © 2015年 徐霜晴. All rights reserved.
//

#import "XSQDetailViewController.h"

@interface XSQDetailViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation XSQDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:imageView];
    [imageView setImage:self.image];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
}

- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
