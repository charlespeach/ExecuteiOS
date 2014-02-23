//
//  EXETaskTextField.m
//  Execute
//
//  Created by Charles Peach on 23/02/14.
//  Copyright (c) 2014 cub3y. All rights reserved.
//

#import "EXETaskTextField.h"

@implementation EXETaskTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        self.layer.cornerRadius = 5.0f;
    }
    return self;
}


- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect rect = [super textRectForBounds:bounds];\
    return CGRectInset(rect, 8.0f, 0.0f);
}


- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

@end
