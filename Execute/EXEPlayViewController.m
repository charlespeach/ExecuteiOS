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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 40.0f, 280.0, 280)];
    label.text = @"Hello World";
    [self.view addSubview:label];
}

@end
