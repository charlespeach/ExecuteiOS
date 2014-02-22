//
//  EXEPlayViewController.m
//  Execute
//
//  Created by Charles Peach on 2/02/14.
//  Copyright (c) 2014 cub3y. All rights reserved.
//

#import "EXEPlayViewController.h"

@implementation EXEPlayViewController

- (void)viewDidLoad {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 40.0f, 280.0f,44.0f )];
    self.label.text = @"Hello World";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor redColor];
    // The subview is relative to its parent (self.view) so will start at 0,0
    [self.view addSubview:self.label];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(20.0f, 60.0f, 280.0f, 440.f)];
    [self.button setTitle:@"Press Me" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    [self.button addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)pressed:(id)sender {
    self.label.text = @"Pressed!";
}

@end
