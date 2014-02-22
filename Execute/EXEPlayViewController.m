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
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20.f, 100.0f, 280.0f, 44.0f)];
    textField.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0f];
    textField.delegate = self;
    [self.view addSubview:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"This is the title" message:textField.text delegate:nil cancelButtonTitle:@"Alrighty" otherButtonTitles:nil];
    [alert show];
    return NO;
}

@end
