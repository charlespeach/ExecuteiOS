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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 40.0f, 280.0f,44.0f )];
    label.text = @"Hello World";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    // The subview is relative to its parent (self.view) so will start at 0,0
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20.0f, 60.0f, 280.0f, 440.f)];
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)pressed:(id)sender {
    NSLog(@"Pressed!");
}

@end
